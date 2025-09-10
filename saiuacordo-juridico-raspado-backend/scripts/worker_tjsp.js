// scripts/worker_tjsp.js — Batch runner para TJSP (usa scrape_one.js)
// Estratégia: filtra CNJs do TJSP no Supabase e executa o scraper em série
// com delays aleatórios para diluir ~500 execuções/dia sem disparar bloqueios.

import 'dotenv/config';
import { spawn } from 'node:child_process';
import { setTimeout as wait } from 'node:timers/promises';
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

function nowISO() { return new Date().toISOString(); }

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

async function listCandidates({ court = 'TJSP', limit = 500, hoursSince = 24 } = {}) {
  const threshold = new Date(Date.now() - hoursSince * 3600_000).toISOString();
  let q = supabase
    .from('processes')
    .select('cnj,court,last_scraped_at')
    .eq('court', court)
    .or(`last_scraped_at.is.null,last_scraped_at.lt.${threshold}`)
    .order('last_scraped_at', { ascending: true })
    .limit(limit);
  const { data, error } = await q;
  if (error) throw new Error('listCandidates: ' + error.message);
  return (data || []).map((r) => r.cnj).filter(Boolean);
}

function runScrapeOne(cnj, envOverrides = {}) {
  return new Promise((resolve, reject) => {
    const env = {
      ...process.env,
      HEADLESS: envOverrides.HEADLESS ?? '1',
      PW_PERSIST_SESSION: envOverrides.PW_PERSIST_SESSION ?? '1',
      PW_USER_DATA_DIR: envOverrides.PW_USER_DATA_DIR ?? '.pw-esaj',
      PW_SLOWMO: envOverrides.PW_SLOWMO ?? (process.env.PW_SLOWMO || '60'),
      PW_STORAGE_STATE: envOverrides.PW_STORAGE_STATE || process.env.PW_STORAGE_STATE || 'esaj-state.json',
    };
    const child = spawn(process.execPath, ['scripts/scrape_one.js', cnj], {
      cwd: process.cwd(),
      env,
      stdio: 'inherit',
    });
    child.on('exit', (code) => {
      if (code === 0) return resolve();
      reject(new Error(`scrape_one exit code ${code}`));
    });
    child.on('error', reject);
  });
}

async function processQueue(cnjs, { minDelayMs = 120_000, maxDelayMs = 240_000 } = {}) {
  let ok = 0, fail = 0;
  for (const cnj of cnjs) {
    const start = Date.now();
    try {
      await runScrapeOne(cnj);
      // reforça marcação para o filtro de próxima execução
      await supabase.from('processes').upsert({ cnj, last_scraped_at: nowISO() }, { onConflict: 'cnj' });
      ok++;
      console.log(`[OK] ${cnj} @ ${nowISO()}`);
    } catch (e) {
      fail++;
      console.warn(`[FAIL] ${cnj} @ ${nowISO()} :: ${e.message}`);
    }
    // Delay aleatório para diluir o tráfego
    const span = Math.max(0, maxDelayMs - minDelayMs);
    const jitter = Math.floor(Math.random() * (span + 1));
    const waitMs = minDelayMs + jitter;
    const elapsed = Date.now() - start;
    const remaining = Math.max(0, waitMs - elapsed);
    if (remaining > 0) await wait(remaining);
  }
  return { ok, fail, total: cnjs.length };
}

async function main() {
  const args = parseArgs(process.argv);
  const court = (args.court || 'TJSP').toUpperCase();
  const quota = Number(args.quota || 500);
  const hoursSince = Number(args.hoursSince || 24);
  const minDelayMs = Number(args.minDelayMs || 120_000); // 2 min
  const maxDelayMs = Number(args.maxDelayMs || 240_000); // 4 min

  console.log(`[START] court=${court} quota=${quota} hoursSince=${hoursSince} delays=[${minDelayMs},${maxDelayMs}]`);

  const list = await listCandidates({ court, limit: quota, hoursSince });
  if (!list.length) {
    console.log('Nada para processar (filtro vazio).');
    return;
  }
  // embaralha para diluir padrões
  list.sort(() => Math.random() - 0.5);

  const { ok, fail, total } = await processQueue(list, { minDelayMs, maxDelayMs });
  console.log(`[DONE] ok=${ok} fail=${fail} total=${total}`);
}

main().catch((e) => { console.error(e); process.exit(1); });
