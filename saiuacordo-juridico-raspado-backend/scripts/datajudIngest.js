// scripts/datajud_ingest.js — Datajud ➜ Supabase (processes, movements, process_parties)
// Node 18+. Sem dependências externas (usa fetch nativo). Estilo e chaves de upsert iguais ao scraper ESAJ. 
// Inspirado no seu scripts/scrape_one.js (ESAJ) para manter compatibilidade de colunas/UPSERT. 
// 
// ✔ Busca no Datajud por CNJ (sem máscara) em endpoints por tribunal (ex.: api_publica_tjsp)
// ✔ Mapeia campos disponíveis para:
//    - processes: cnj, court, system, classe, assunto, orgao_julgador, (foro/vara heurísticos opcionais),
//                 distribution_at, last_detail_at (maior data de movimento), valor_acao, partes (jsonb)
//    - movements: process_cnj, moved_at (DATE), description, hash
//    - process_parties: process_cnj, role, name, document
// ✔ UPSERT idempotente (onConflict: 'cnj' / 'process_cnj,hash' / 'process_cnj,role,name')
// ✔ Backfill para todos os processos do Supabase (filtro por tribunal), com RPS configurável e retries 429/5xx
// ✔ CLI:
//    node scripts/datajud_ingest.js one TJSP 0000000-00.0000.0.00.0000
//    node scripts/datajud_ingest.js backfill --court=TJSP --limit=2500 --offset=0 --rps=2 --concurrency=2
//
// ENV obrigatórias:
//   SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, DATAJUD_API_KEY
// ENV opcionais:
//   DERIVE_FORO_VARA=1       -> tenta derivar foro/vara a partir de orgaoJulgador.nome
//   DATAJUD_TIMEOUT_MS=12000 -> timeout por request
//   MAX_RETRIES=3            -> tentativas em 429/5xx
//   BACKFILL_PAGE_SIZE=1000  -> paginação na leitura da tabela processes
//   LOG_BODY=0/1             -> loga body enviado ao Datajud (debug)

import 'dotenv/config';
import crypto from 'node:crypto';
import { createClient } from '@supabase/supabase-js';

// ============================= ENV / CLIENTS =============================
const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
const DATAJUD_API_KEY = process.env.DATAJUD_API_KEY; // formato: ApiKey <base64>

if (!SUPABASE_URL || !SUPABASE_KEY) {
  console.error('[ENV] SUPABASE_URL e SUPABASE_SERVICE_ROLE_KEY são obrigatórios.');
  process.exit(1);
}
if (!DATAJUD_API_KEY) {
  console.error('[ENV] DATAJUD_API_KEY é obrigatória.');
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

const CONFIG = {
  TIMEOUT_MS: Number(process.env.DATAJUD_TIMEOUT_MS || 12000),
  MAX_RETRIES: Number(process.env.MAX_RETRIES || 3),
  RPS: Number((process.env.RPS || process.env.DATAJUD_RPS || 2)),
  CONCURRENCY: Number(process.env.CONCURRENCY || 2),
  BACKFILL_PAGE_SIZE: Number(process.env.BACKFILL_PAGE_SIZE || 1000),
  DERIVE_FORO_VARA: String(process.env.DERIVE_FORO_VARA || '1') === '1',
  LOG_BODY: String(process.env.LOG_BODY || '0') === '1',
};

// Rate limit simples (global) — distribui chamadas em intervalos regulares
let _nextSlot = 0;
const _interval = Math.max(1, Math.floor(1000 / Math.max(1, CONFIG.RPS)));
async function rateLimit() {
  const now = Date.now();
  if (now < _nextSlot) {
    const wait = _nextSlot - now;
    await new Promise(r => setTimeout(r, wait));
  }
  _nextSlot = Date.now() + _interval;
}

// ============================= Helpers =============================
const sha1 = (s) => crypto.createHash('sha1').update(String(s)).digest('hex');
const sleep = (ms) => new Promise(r => setTimeout(r, ms));

function onlyDigits(s) { return String(s || '').replace(/\D+/g, ''); }
function cnjToDigits(cnj) {
  const d = onlyDigits(cnj);
  if (d.length === 20) return d; // já 20 dígitos
  // tenta reconstituir se vier com máscara irregular
  return d.padStart(20, '0');
}

function cnjDigitsToMasked(d) {
  const digits = cnjToDigits(d);
  const m = digits.match(/^(\d{7})(\d{2})(\d{4})(\d)(\d{2})(\d{4})$/);
  if (!m) return digits;
  return `${m[1]}-${m[2]}.${m[3]}.${m[4]}.${m[5]}.${m[6]}`;
}

function toISODate(iso) {
  if (!iso) return null;
  try {
    const d = new Date(iso);
    if (isNaN(d.getTime())) return null;
    return d.toISOString().slice(0, 10); // YYYY-MM-DD
  } catch { return null; }
}

function pickAssunto(src) {
  const a = Array.isArray(src.assuntos) ? src.assuntos : [];
  if (a.length && a[0]) return a[0].nome || String(a[0].codigo ?? '');
  return null;
}
function pickDistributionAt(src) {
  return src.dataDistribuicao || src.dataAjuizamento || src.dataAutuacao || null;
}
function lastDetailAt(src) {
  const movs = Array.isArray(src.movimentos) ? src.movimentos : [];
  const times = movs.map(m => m.dataHora || m.data).filter(Boolean).map(s => Date.parse(s)).filter(Number.isFinite);
  if (!times.length) return null;
  return new Date(Math.max(...times)).toISOString();
}

function deriveForoVara(orgaoNome) {
  if (!CONFIG.DERIVE_FORO_VARA || !orgaoNome) return { foro: null, vara: null };
  const t = String(orgaoNome).trim().toUpperCase().replace(/\s+/g, ' ');
  let m = t.match(/^0?(\d{1,2})\s+CIVEL\s+DE\s+(.+)$/);
  if (m) return { foro: m[2].toLowerCase().replace(/\b(\w)/g, c => c.toUpperCase()), vara: `${Number(m[1])}ª Vara Cível` };
  m = t.match(/^(\d{1,2})\s+VARA\s+(.+?)\s+DE\s+(.+)$/);
  if (m) return { foro: m[3].toLowerCase().replace(/\b(\w)/g, c => c.toUpperCase()), vara: `${Number(m[1])}ª Vara ${m[2].toLowerCase().replace(/\b(\w)/g, c => c.toUpperCase())}` };
  const parts = t.split(' DE ');
  const foro = parts.length >= 2 ? parts[parts.length - 1].toLowerCase().replace(/\b(\w)/g, c => c.toUpperCase()) : null;
  return { foro, vara: null };
}

// ============================= Datajud =============================
function courtToSlug(court) {
  // Ex.: 'TJSP' -> 'tjsp'; 'TJMG' -> 'tjmg'; 'TRF1' -> 'trf1'
  if (!court) return null;
  const s = String(court).trim().toLowerCase();
  if (/^tj[a-z]{2}$/.test(s)) return s; // tjsp, tjmg...
  if (/^trf[1-5]$/.test(s)) return s;   // trf1..trf5
  if (s === 'tst' || s === 'trt' || s.startsWith('trt')) return s; // (caso queira ampliar)
  // Se vier como 'TJSP' em maiúsculas
  if (/^tj[A-Z]{2}$/.test(court)) return court.toLowerCase();
  return s; // fallback (deixe passar)
}

function datajudUrlForCourt(court) {
  const slug = courtToSlug(court || 'TJSP');
  return `https://api-publica.datajud.cnj.jus.br/api_publica_${slug}/_search`;
}

async function fetchDatajudByCNJ(court, cnjDigits) {
  const url = datajudUrlForCourt(court);
  const body = {
    size: 1,
    _source: [
      'numeroProcesso','siglaTribunal','tribunal','sistema','grau',
      'classe.codigo','classe.nome',
      'assuntos.codigo','assuntos.nome',
      'orgaoJulgador.codigo','orgaoJulgador.nome',
      'valorCausa','dataAjuizamento','dataDistribuicao','dataAutuacao','@timestamp',
      'partes.polo','partes.tipoParte','partes.nome','partes.documento',
      'movimentos.dataHora','movimentos.codigo','movimentos.nome','movimentos.complemento','movimentos.complementosTabelados'
    ],
    query: { match: { numeroProcesso: cnjDigits } }
  };
  if (CONFIG.LOG_BODY) console.log('[DATAJUD] body =>', JSON.stringify(body));

  for (let attempt = 0; attempt <= CONFIG.MAX_RETRIES; attempt++) {
    await rateLimit();
    const ctrl = new AbortController();
    const to = setTimeout(() => ctrl.abort(), CONFIG.TIMEOUT_MS);
    let res;
    try {
      res = await fetch(url, {
        method: 'POST',
        headers: {
          'Authorization': `ApiKey ${DATAJUD_API_KEY}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(body),
        signal: ctrl.signal
      });
    } catch (err) {
      clearTimeout(to);
      if (attempt === CONFIG.MAX_RETRIES) throw err;
      const backoff = (attempt + 1) * 1000;
      console.warn(`[DATAJUD] erro de rede, retry em ${backoff}ms…`, err?.message || err);
      await sleep(backoff);
      continue;
    }
    clearTimeout(to);

    if (res.status === 429 || res.status >= 500) {
      if (attempt === CONFIG.MAX_RETRIES) {
        const txt = await res.text().catch(()=>'');
        throw new Error(`[DATAJUD] ${res.status} após retries. ${txt}`);
      }
      const backoff = (attempt + 1) * 1500;
      console.warn(`[DATAJUD] ${res.status} — retry em ${backoff}ms…`);
      await sleep(backoff);
      continue;
    }
    if (!res.ok) {
      const txt = await res.text().catch(()=> '');
      throw new Error(`[DATAJUD] HTTP ${res.status}: ${txt}`);
    }
    const json = await res.json();
    const hit = json?.hits?.hits?.[0];
    return hit?._source || null;
  }
  return null;
}

// ======= Foro/Vara derivation (obrigatório) =======
function forceForoVara(orgaoNome, { grau } = {}) {
  if (!orgaoNome) return { foro: 'Desconhecido', vara: 'Desconhecida', confidence: 0 };

  const stripAccents = (s) => s.normalize('NFD').replace(/[\u0300-\u036f]/g, '');
  const norm  = (s) => stripAccents(String(s)).toUpperCase().replace(/\s+/g, ' ').trim();
  const title = (s) => String(s || '')
    .toLowerCase()
    .split(' ')
    .map(w => w ? w[0].toUpperCase() + w.slice(1) : '')
    .join(' ');

  const t = norm(orgaoNome);
  let m;

  // 02 CIVEL DE INDAIATUBA  →  Vara: 2ª Vara Cível | Foro: Indaiatuba
  m = t.match(/^0?(\d{1,2})\s+CIVEL\s+DE\s+(.+)$/);
  if (m) return { foro: title(m[2]), vara: `${Number(m[1])}ª Vara Cível`, confidence: 0.95 };

  // 3 VARA CRIMINAL DE SANTOS | 1 VARA DA FAZENDA PUBLICA DE CAMPINAS
  m = t.match(/^(\d{1,2})\s+VARA\s+(.+?)\s+DE\s+(.+)$/);
  if (m) return { foro: title(m[3]), vara: `${Number(m[1])}ª Vara ${title(m[2])}`, confidence: 0.9 };

  // JUIZADO ESPECIAL CIVEL DE SOROCABA
  m = t.match(/^JUIZADO\s+ESPECIAL\s+(.+?)\s+DE\s+(.+)$/);
  if (m) return { foro: title(m[2]), vara: `Juizado Especial ${title(m[1])}`, confidence: 0.9 };

  // JUIZADO ESPECIAL DA FAZENDA PUBLICA DE RIBEIRAO PRETO
  m = t.match(/^JUIZADO\s+ESPECIAL\s+DA\s+(.+?)\s+DE\s+(.+)$/);
  if (m) return { foro: title(m[2]), vara: `Juizado Especial da ${title(m[1])}`, confidence: 0.9 };

  // VARA DO JUIZADO ESPECIAL ... - FORO REGIONAL DE SANTANA
  m = t.match(/^VARA\s+DO\s+JUIZADO\s+ESPECIAL\s+(.+?)(?:\s+-\s+FORO\s+REGIONAL\s+DE\s+(.+))?$/);
  if (m) return { foro: title(m[2] || 'Desconhecido'), vara: `Vara do Juizado Especial ${title(m[1])}`, confidence: 0.8 };

  // Órgãos colegiados (2º grau): não há "vara/foro" clássicos
  if (/CAMARA|SECAO|TURMA\s+RECURSAL|COLEGIO\s+RECURSAL/.test(t)) {
    return { foro: 'Órgão Colegiado', vara: title(orgaoNome), confidence: 0.6 };
  }

  // Fallback: tudo antes do último " DE " vira "vara"; último pedaço vira "foro"
  const parts = t.split(' DE ');
  if (parts.length >= 2) {
    const foro = title(parts[parts.length - 1]);
    const pre  = parts.slice(0, -1).join(' de ');
    return { foro, vara: title(pre), confidence: 0.5 };
  }

  // Último recurso: mostra algo amigável
  return { foro: 'Desconhecido', vara: title(String(orgaoNome)), confidence: 0.3 };
}

// ============================= Mapeadores =============================
function mapProcess(src) {
  if (!src) return null;
  const sistema = typeof src.sistema === 'object' ? (src.sistema?.nome || src.sistema?.codigo) : src.sistema;
  const classe = typeof src.classe === 'object' ? (src.classe?.nome || src.classe?.codigo) : src.classe;
  const orgaoNome = src.orgaoJulgador?.nome || null;
  const { foro, vara } = forceForoVara(orgaoNome, { grau: src.grau });

  return {
    cnj: src.numeroProcesso,
    court: src.siglaTribunal || src.tribunal || 'TJSP',
    system: sistema || 'eSAJ',
    grau: src.grau || null,
    classe: classe || null,
    assunto: pickAssunto(src),
    orgao_julgador: orgaoNome,
    foro: foro,
    vara: vara,
    juiz: null, // Datajud não traz
    valor_acao: src.valorCausa ?? null,
    distribution_at: pickDistributionAt(src) || null,
    last_detail_at: lastDetailAt(src),
    partes: Array.isArray(src.partes) ? src.partes : null,
    last_scraped_at: new Date().toISOString(),
  };
}

function describeMovement(m) {
  const base = [m.nome, m.complemento].filter(Boolean).join(' - ');
  const tab = Array.isArray(m.complementosTabelados) ? m.complementosTabelados : [];
  if (tab.length) {
    const k = tab[0]?.nome; const v = tab[0]?.descricao || tab[0]?.valor;
    if (k || v) return `${base} [${k || ''}: ${v || ''}]`.trim();
  }
  return base;
}

function mapMovements(src) {
  const cnj = src?.numeroProcesso;
  const movs = Array.isArray(src?.movimentos) ? src.movimentos : [];
  return movs.map(m => {
    const moved_at = toISODate(m.dataHora || m.data);
    const description = describeMovement(m);
    const key = `${cnj}|${m.dataHora || m.data || ''}|${m.codigo || ''}|${(m.complemento || '').trim()}`;
    return {
      process_cnj: cnj,
      moved_at,
      description,
      hash: sha1(key),
    };
  })
  .filter(r => r.moved_at && r.description);
}

function mapParties(src) {
  const cnj = src?.numeroProcesso;
  const partes = Array.isArray(src?.partes) ? src.partes : [];
  return partes.map(p => ({
    process_cnj: cnj,
    role: p.tipoParte || p.polo || null,
    name: p.nome || null,
    document: p.documento || null,
  })).filter(r => r.role && r.name);
}

// ============================= Persistência =============================
// Colunas existentes em 'processes' segundo schemasupabase.json
const PROCESS_ALLOWED_COLS = new Set([
  'cnj','court','system','last_scraped_at','created_at','classe','assunto','foro','vara','juiz',
  'partes','last_detail_at','peticoes','incidentes','apensos','audiencias','distribution_at',
  'control_code','area','valor_acao','updated_at'
]);

function filterProcessPayload(row) {
  const out = {};
  for (const k of Object.keys(row || {})) {
    if (PROCESS_ALLOWED_COLS.has(k)) out[k] = row[k];
  }
  return out;
}

// Resolve qual formato de CNJ usar para persistir (respeita o já existente)
async function resolvePersistCNJ(inputCnjLike) {
  const d = cnjToDigits(inputCnjLike || '');
  const masked = cnjDigitsToMasked(d);
  // prioriza formato já existente no banco para manter integridade de FKs
  for (const candidate of [masked, d]) {
    const { data } = await supabase
      .from('processes')
      .select('cnj')
      .eq('cnj', candidate)
      .maybeSingle();
    if (data && data.cnj) return candidate;
  }
  return masked || d;
}

async function upsertProcess(row) {
  const payload = filterProcessPayload({ ...row });
  // Normalizações finais
  if (payload.distribution_at && !/T/.test(payload.distribution_at)) {
    // se veio yyyy-mm-dd, promova para ISO completo
    payload.distribution_at = `${payload.distribution_at}T00:00:00`;
  }
  const { error } = await supabase.from('processes').upsert(payload, { onConflict: 'cnj' });
  if (error) throw new Error('upsert processes: ' + error.message);
}

async function upsertMovements(rows) {
  if (!rows?.length) return;
  const { error } = await supabase.from('movements').upsert(rows, {
    onConflict: 'process_cnj,hash', ignoreDuplicates: true
  });
  if (error) throw new Error('upsert movements: ' + error.message);
}

async function upsertParties(rows) {
  if (!rows?.length) return;
  const { error } = await supabase.from('process_parties').upsert(rows, {
    onConflict: 'process_cnj,role,name', ignoreDuplicates: true
  });
  if (error) throw new Error('upsert parties: ' + error.message);
}

// ============================= Work units =============================
async function processOne(court, cnj) {
  const d = cnjToDigits(cnj);
  const src = await fetchDatajudByCNJ(court, d);
  if (!src) {
    console.log(`[MISS] ${court} ${cnj} – sem hit no Datajud.`);
    return { ok: false };
  }

  // Unifica CNJ com o padrão armazenado (ou mascarado por padrão)
  const persistCNJ = await resolvePersistCNJ(src.numeroProcesso || d);

  // Garante que processos/movimentos/partes usem o MESMO CNJ
  const proc = { ...mapProcess(src), cnj: persistCNJ };
  const srcWithCNJ = { ...src, numeroProcesso: persistCNJ };
  const movs = mapMovements(srcWithCNJ);
  const parties = mapParties(srcWithCNJ);

  await upsertProcess(proc);
  await upsertMovements(movs);
  await upsertParties(parties);

  console.log(`[OK] ${proc.court} ${proc.cnj} — proc ok; movs=${movs.length}; partes=${parties.length}`);
  return { ok: true, movs: movs.length, partes: parties.length };
}

// Lê CNJs do Supabase (tabela processes)
async function* iterateProcessesFromDB({ court = 'TJSP', limit = 2500, offset = 0, pageSize = CONFIG.BACKFILL_PAGE_SIZE }) {
  let fetched = 0;
  let page = 0;
  while (fetched < limit) {
    const from = offset + page * pageSize;
    const to = Math.min(offset + (page + 1) * pageSize - 1, offset + limit - 1);

    const query = supabase.from('processes')
      .select('cnj,court', { count: 'exact' })
      .range(from, to)
      .order('cnj', { ascending: true });

    if (court && court !== 'ALL') query.eq('court', court);

    const { data, error } = await query;
    if (error) throw new Error('select processes: ' + error.message);
    if (!data || !data.length) break;

    for (const row of data) yield row;

    fetched += data.length;
    page++;
  }
}

async function backfill({ court = 'TJSP', limit = 2500, offset = 0 }) {
  const workers = Math.max(1, CONFIG.CONCURRENCY);
  const queue = [];

  const it = iterateProcessesFromDB({ court, limit, offset });

  async function worker(id) {
    for await (const row of it) {
      try {
        await processOne(row.court || court, row.cnj);
      } catch (err) {
        console.warn(`[FAIL] ${row.court||court} ${row.cnj}:`, err?.message || err);
      }
    }
  }

  for (let i = 0; i < workers; i++) queue.push(worker(i));
  await Promise.all(queue);
}

// ============================= CLI =============================
function parseArgs(argv) {
  const args = { _: [] };
  for (let i = 2; i < argv.length; i++) {
    const a = argv[i];
    if (a.startsWith('--')) {
      const [k, v] = a.slice(2).split('=');
      args[k] = v === undefined ? true : v;
    } else {
      args._.push(a);
    }
  }
  return args;
}

(async function main(){
  const args = parseArgs(process.argv);
  const cmd = args._[0];
  if (!cmd || cmd === 'help' || cmd === '-h' || cmd === '--help') {
    console.log(`\nUso:\n  node scripts/datajud_ingest.js one <COURT> <CNJ>\n  node scripts/datajud_ingest.js backfill [--court=TJSP|ALL] [--limit=2500] [--offset=0] [--rps=2] [--concurrency=2]\n\nExemplos:\n  node scripts/datajud_ingest.js one TJSP 1014415-37.2022.8.26.0248\n  RPS=3 CONCURRENCY=3 node scripts/datajud_ingest.js backfill --court=TJSP --limit=5000\n`);
    process.exit(0);
  }

  if (args.rps) { CONFIG.RPS = Number(args.rps); }
  if (args.concurrency) { CONFIG.CONCURRENCY = Number(args.concurrency); }

  if (cmd === 'one') {
    const court = args._[1] || 'TJSP';
    const cnj = args._[2];
    if (!cnj) { console.error('Informe: one <COURT> <CNJ>'); process.exit(1); }
    try {
      await processOne(court, cnj);
    } catch (err) {
      console.error('[ERROR]', err);
      process.exit(2);
    }
    process.exit(0);
  }

  if (cmd === 'backfill') {
    const court = (args.court || 'TJSP').toUpperCase();
    const limit = Number(args.limit || 2500);
    const offset = Number(args.offset || 0);
    try {
      await backfill({ court, limit, offset });
    } catch (err) {
      console.error('[ERROR]', err);
      process.exit(2);
    }
    process.exit(0);
  }

  console.error('Comando desconhecido:', cmd);
  process.exit(1);
})();
