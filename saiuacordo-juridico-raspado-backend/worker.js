// worker.js
import 'dotenv/config';
import { createClient } from '@supabase/supabase-js';
import cron from 'node-cron';
import pLimit from 'p-limit';
import crypto from 'node:crypto';

// Conexão com o Supabase (use a Service Role Key)
const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

// util: sha1 para o hash de cada movimentação
const sha1 = (s) => crypto.createHash('sha1').update(s).digest('hex');

// Lista CNJs da tabela "processes"
async function listProcesses(limit = 5000) {
  const { data, error } = await supabase
    .from('processes')
    .select('cnj')
    .order('created_at', { ascending: false })
    .limit(limit);

  if (error) throw new Error('listProcesses: ' + error.message);
  return (data || []).map((r) => r.cnj);
}

// ====== FAKE SCRAPER (placeholder) ======
// Gera 2 movimentações de teste por CNJ. Depois trocamos por Playwright.
async function fakeScrape(cnj) {
  const now = new Date();
  const d1 = now.toISOString().slice(0, 10); // hoje
  const d0 = new Date(now.getTime() - 86400000).toISOString().slice(0, 10); // ontem

  const items = [
    { moved_at: d1, description: 'Atualização automática (teste)', source_url: null, raw_html: null },
    { moved_at: d0, description: 'Publicação de despacho (teste)', source_url: null, raw_html: null },
  ];

  // anexa o hash único baseado no conteúdo
  return items.map((i) => ({
    ...i,
    hash: sha1(`${cnj}|${i.moved_at}|${i.description}`),
  }));
}

// Upsert de movimentações + marca last_scraped_at no processo
async function upsertMovements(cnj, items) {
  if (!items?.length) return { inserted: 0 };

  // garante/atualiza o processo por CNJ (seu schema usa id UUID e CNJ UNIQUE)
  const { error: e1 } = await supabase
    .from('processes')
    .upsert({ cnj, last_scraped_at: new Date().toISOString() }, { onConflict: 'cnj' });
  if (e1) throw new Error('upsert(process): ' + e1.message);

  // upsert das movimentações respeitando a UNIQUE (process_cnj, hash)
  const rows = items.map((i) => ({ process_cnj: cnj, ...i }));
  const { error: e2 } = await supabase
    .from('movements')
    .upsert(rows, { onConflict: 'process_cnj,hash', ignoreDuplicates: true });
  if (e2) throw new Error('upsert(movements): ' + e2.message);

  return { inserted: rows.length };
}

// Executa para 1 CNJ
async function runOnce(cnj) {
  // Troque fakeScrape por scrape real quando estiver pronto
  const items = await fakeScrape(cnj);
  const { inserted } = await upsertMovements(cnj, items);
  return { cnj, inserted };
}

// Executa em lote para todos os processos (com concorrência controlada)
async function runBatch(concurrency = 2) {
  const cnjs = await listProcesses(5000);
  if (!cnjs.length) {
    console.log('Nenhum processo em "processes". Importe/insira CNJs primeiro.');
    return;
  }

  const limit = pLimit(concurrency);
  let ok = 0, fail = 0;

  await Promise.all(
    cnjs.map((cnj) =>
      limit(async () => {
        try {
          const r = await runOnce(cnj);
          ok++;
          console.log(`[OK] ${r.cnj} -> ${r.inserted} itens`);
        } catch (e) {
          fail++;
          console.error(`[FAIL] ${cnj}: ${e.message}`);
        }
      })
    )
  );

  console.log(`\nResumo: ok=${ok}, fail=${fail}, total=${cnjs.length}`);
}

// CLI simples:
//   node worker.js --once <CNJ>     (roda 1 CNJ)
//   node worker.js --all            (roda todos agora)
//   node worker.js                  (fica agendado via CRON)
const [flag, arg] = process.argv.slice(2);

if (flag === '--once' && arg) {
  runOnce(arg)
    .then((r) => {
      console.log('Once:', r);
      process.exit(0);
    })
    .catch((e) => {
      console.error(e);
      process.exit(1);
    });
} else if (flag === '--all') {
  runBatch(2)
    .then(() => process.exit(0))
    .catch((e) => {
      console.error(e);
      process.exit(1);
    });
} else {
  // Agenda padrão: segunda-feira às 07:00
  const expr = process.env.CRON_SCHEDULE || '0 7 * * 1';
  cron.schedule(expr, async () => {
    console.log(`[CRON] start ${new Date().toISOString()}`);
    await runBatch(2);
  });
  console.log(`Worker agendado. Expressão: "${expr}". Exemplos:
  - node worker.js --once 0000000-00.0000.0.00.0000
  - node worker.js --all
  - (ou aguarde o horário agendado)
`);
}
