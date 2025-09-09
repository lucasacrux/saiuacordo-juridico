// server.js (ESM) — Backend do SaiuAcordo: Express + Supabase + Playwright (login TJSP real)
import 'dotenv/config';
import express from 'express';
import cors from 'cors';
import multer from 'multer';
import { z } from 'zod';
import { createClient } from '@supabase/supabase-js';
import { randomUUID } from 'node:crypto';
import os from 'node:os';
import path from 'node:path';
import { chromium } from 'playwright';
import cookieParser from 'cookie-parser';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcryptjs';

const app = express();
app.use(express.json());
app.use(cors({
  origin: process.env.FRONT_ORIGIN || 'http://localhost:5175',
  credentials: true
}));
app.use(cookieParser());

// =====================================================================
// HELPERS GERAIS
// =====================================================================
const wait = (ms) => new Promise(r => setTimeout(r, ms));
const now = () => Date.now();
const onlyDigits = (s) => String(s || '').replace(/\D/g, '');

// =====================================================================
// CONFIG
// =====================================================================
const HEADLESS = process.env.HEADLESS === '0' ? false : true; // default: headless
const SLOW_MO = Number(process.env.PW_SLOWMO || 0);           // default: 0ms
const OTP_WAIT_MS = Number(process.env.TJSP_OTP_TIMEOUT_MS || 15000); // default: 15s
const FLOW_TTL_MS = Number(process.env.TJSP_FLOW_TTL_MS || 30 * 60 * 1000);

const AUTH_SECRET = process.env.AUTH_SECRET || 'dev-secret';
const COOKIE_NAME = 'sa_auth';
const COOKIE_DOMAIN = process.env.COOKIE_DOMAIN || undefined; // em dev, deixe vazio

// =====================================================================
// AUTH UTILS
// =====================================================================
function signJWT(u, extras = {}) {
  return jwt.sign(
    {
      sub: u.id,
      oab: u.oab,
      uf: u.uf,
      role: u.role || 'advogado',
      cpf: u.cpf,
      cnpj: u.cnpj,
      ...extras
    },
    AUTH_SECRET,
    { expiresIn: '7d' }
  );
}
function setAuthCookie(res, token) {
  res.cookie(COOKIE_NAME, token, {
    httpOnly: true,
    sameSite: 'lax',
    secure: process.env.NODE_ENV === 'production',
    domain: COOKIE_DOMAIN, // undefined em dev
    path: '/',
  });
}
function requireAuth(req, res, next) {
  const hdr = req.headers.authorization || '';
  const token = (req.cookies && req.cookies[COOKIE_NAME]) || hdr.replace(/^Bearer\s+/, '');
  try {
    req.user = jwt.verify(token, AUTH_SECRET);
    return next();
  } catch {
    return res.status(401).json({ error: 'unauthorized' });
  }
}

// =====================================================================
// SUPABASE
// =====================================================================
const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
if (!supabaseUrl || !supabaseKey) {
  console.warn('[WARN] SUPABASE_URL ou SUPABASE_SERVICE_ROLE_KEY ausentes no .env');
}
const supabase = createClient(supabaseUrl, supabaseKey);

// =====================================================================
// HTTP HELPERS
// =====================================================================
const ok  = (res, data = {}) => res.json({ ok: true, ...data });
const bad = (res, code = 400, msg = 'invalid') => res.status(code).json({ error: msg });

// =====================================================================
// PLAYWRIGHT HELPERS
// =====================================================================

// seta value via JS + eventos (fallback)
async function setInputValueHard(locator, value) {
  await locator.evaluate((el, v) => {
    el.focus?.();
    if ('select' in el && typeof el.select === 'function') el.select();
    if ('value' in el) el.value = v; else el.setAttribute('value', v);
    el.dispatchEvent(new Event('input',  { bubbles: true }));
    el.dispatchEvent(new Event('change', { bubbles: true }));
    el.dispatchEvent(new Event('blur',   { bubbles: true }));
  }, String(value));
}

// preenche estável (sem teclado global do page)
async function safeFillStrict(locator, value) {
  const val = String(value ?? '');
  await locator.scrollIntoViewIfNeeded().catch(()=>{});
  try { // 1) fill
    await locator.fill('');
    await locator.fill(val);
    if ((await locator.inputValue()) === val) return 'fill';
  } catch {}
  try { // 2) type
    await locator.click({ clickCount: 3 }).catch(()=>{});
    await locator.type(val, { delay: 35 });
    if ((await locator.inputValue()) === val) return 'type';
  } catch {}
  // 3) fallback JS
  await setInputValueHard(locator, val);
  return 'hard';
}

async function findInputByLabel(scope, labelRegex) {
  const lbl = scope.locator('label, span, div').filter({ hasText: labelRegex }).first();
  if (await lbl.count() === 0) return null;
  const forAttr = await lbl.getAttribute('for').catch(()=>null);
  if (forAttr) {
    const byId = scope.locator(`[id="${forAttr}"]`);
    if (await byId.isVisible().catch(()=>false)) return byId;
  }
  const candidate = lbl.locator('xpath=following::input[1]').first();
  if (await candidate.isVisible().catch(()=>false)) return candidate;
  const parentInput = lbl.locator('..').locator('input').first();
  if (await parentInput.isVisible().catch(()=>false)) return parentInput;
  return null;
}

async function ensureCpfTab(page) {
  try {
    const tab = page.getByRole('tab', { name: /cpf\s*\/\s*cnpj/i }).first();
    if (await tab.isVisible().catch(()=>false)) {
      await tab.click({ delay: 50 }).catch(()=>{});
      await page.waitForTimeout(200);
    }
  } catch {}
}

// acha user/password no MESMO form; varre página + iframes
async function findLoginInputsTJSP(page) {
  const scopes = [page, ...page.frames()];

  for (const scope of scopes) {
    const hit = await _scanScope(scope);
    if (hit) return hit;
  }
  return { userInput: null, passInput: null, form: null, scope: page };

  async function _scanScope(scope) {
    // 1) senha visível
    let passInput = scope
      .locator('input[type="password"]')
      .filter({ hasNot: scope.locator('[hidden]') })
      .first();

    if (!(await passInput.count())) return null;

    // 2) form da senha
    const form = passInput.locator('xpath=ancestor::form[1]');

    // 3) usuário dentro do MESMO form
    let userInput = form.locator([
      'input[name*="cpf" i]','input[id*="cpf" i]',
      'input[name*="cnpj" i]','input[id*="cnpj" i]',
      'input[name*="usuario" i]','input[id*="usuario" i]',
      'input[name*="login" i]','input[id*="login" i]',
      'input[type="text"]:not([disabled])',
      'input[type="email"]:not([disabled])'
    ].join(', ')).first();

    // fallback: qualquer input não-password do mesmo form
    if (!(await userInput.count())) {
      userInput = form.locator('input:not([type="password"]):not([type="hidden"]):not([disabled])').first();
    }

    // último recurso: por label visível no MESMO frame
    if (!(await userInput.count())) {
      const byLabel = await findInputByLabel(scope, /(cpf\/?cnpj|cpf|cnpj|usu[aá]rio|login)/i);
      if (byLabel) userInput = byLabel;
    }

    if (!(await userInput.count())) return null;

    // 4) não pode ser o MESMO elemento da senha
    try {
      const [uEl, pEl] = await Promise.all([userInput.elementHandle(), passInput.elementHandle()]);
      if (uEl && pEl) {
        const same = await scope.evaluate((a,b)=>a===b, uEl, pEl).catch(()=>false);
        if (same) {
          const alt = form.locator('input[type="text"], input[type="email"]').first();
          if (await alt.count()) userInput = alt; else return null;
        }
      }
    } catch {}

    // 5) visíveis
    const okU = await userInput.isVisible().catch(()=>false);
    const okP = await passInput.isVisible().catch(()=>false);
    if (!okU || !okP) return null;

    return { userInput, passInput, form, scope };
  }
}

async function clickLoginSmart(page, passInput) {
  try {
    const form = passInput.locator('xpath=ancestor::form[1]');
    const submit = form.locator('button[type="submit"], input[type="submit"]').first();
    if (await submit.isVisible().catch(()=>false)) {
      await submit.click({ delay: 60 }).catch(()=>{});
      return;
    }
    const btn = form.getByRole('button', { name: /(entrar|acessar|login|autenticar|continuar|confirmar)/i }).first();
    if (await btn.isVisible().catch(()=>false)) {
      await btn.click({ delay: 60 }).catch(()=>{});
      return;
    }
  } catch {}
  // fallbacks globais
  const globalBtn = page.getByRole('button', { name: /(entrar|acessar|login|autenticar|continuar|confirmar)/i }).first();
  if (await globalBtn.isVisible().catch(()=>false)) { await globalBtn.click({ delay: 60 }).catch(()=>{}); return; }
  const submits = page.locator('input[type="submit"], button[type="submit"]').filter({ hasText: /(entrar|acessar|login|autenticar|confirmar)/i });
  if (await submits.count()) { await submits.first().click({ delay: 60 }).catch(()=>{}); return; }
  try { await passInput.press('Enter'); } catch {}
}

function otpSelectorString() {
  return [
    'input[name*="otp" i]',
    'input[name*="token" i]',
    'input[name*="codigo" i]',
    'input[id*="otp" i]',
    'input[id*="token" i]',
    'input[id*="codigo" i]'
  ].join(', ');
}

// === NOVO: acha 1 input único de OTP em qualquer frame ===
// Encontra input único de OTP em qualquer frame (mais robusto p/ modal "Validação de login")
async function findOtpInputAcrossFrames(page) {
  const selector = otpSelectorString();
  const scopes = [page, ...page.frames()];

  for (const scope of scopes) {
    try {
      // A) direto por id/name usuais (otp|token|codigo)
      const loc = scope.locator(selector).filter({ hasNot: scope.locator('[hidden]') }).first();
      if (await loc.isVisible().catch(()=>false)) return { scope, otpInput: loc };

      // B) placeholder/aria-label típicos do ESAJ ("Ex.:123456", "código", "token")
      const ph = scope.locator([
        'input[placeholder*="123456" i]',
        'input[placeholder*="código" i]',
        'input[placeholder*="codigo" i]',
        'input[aria-label*="código" i]',
        'input[aria-label*="codigo" i]',
        'input[aria-label*="token" i]'
      ].join(',')).first();
      if (await ph.isVisible().catch(()=>false)) return { scope, otpInput: ph };

      // C) próximo de textos do modal ("Validação de login", "Insira o código", etc.)
      const near = scope
        .locator('text=/valida(ç|c)ão de login|insira o c(ó|o)digo|verifica(ç|c)ão/i')
        .locator('xpath=following::input[not(@type="hidden")][1]')
        .first();
      if (await near.isVisible().catch(()=>false)) return { scope, otpInput: near };

      // D) campo numérico isolado (único input editável dentro do modal)
      const modal = scope.locator('div,section,form').filter({ hasText: /valida(ç|c)ão de login|c(ó|o)digo/i }).first();
      const only = modal.locator('input:not([type="hidden"]):not([disabled])').first();
      if (await only.isVisible().catch(()=>false)) return { scope, otpInput: only };
    } catch {}
  }
  return { scope: page, otpInput: null };
}


// === NOVO: detecta grupos de inputs de 1 dígito (multi-caixa OTP) em qualquer frame ===
async function findOtpDigitBoxesAcrossFrames(page) {
  const scopes = [page, ...page.frames()];
  for (const scope of scopes) {
    try {
      // procura containers que mencionam código/token/verificação
      const containers = scope.locator([
        'form:has-text(/c[oó]digo|token|verifica/i)',
        'div:has-text(/c[oó]digo|token|verifica/i)',
        'section:has-text(/c[oó]digo|token|verifica/i)'
      ].join(', '));
      const cnt = await containers.count();
      for (let c = 0; c < Math.min(cnt, 4); c++) {
        const within = containers.nth(c).locator('input:not([type="hidden"]):not([disabled])');
        const total = await within.count();
        if (!total) continue;
        const inputs = [];
        for (let i = 0; i < Math.min(total, 12); i++) {
          const it = within.nth(i);
          let ml = null, type = '';
          try { ml = await it.getAttribute('maxlength'); } catch {}
          try { type = (await it.getAttribute('type')) || ''; } catch {}
          if (ml === '1' || ml === '2' || /tel|text|number/i.test(type)) {
            inputs.push(it);
          }
        }
        if (inputs.length >= 4 && inputs.length <= 8) {
          return { scope, inputs };
        }
      }
      // fallback: qualquer conjunto visível de maxlength=1
      const any = scope.locator('input[maxlength="1"]:not([type="hidden"]):not([disabled])');
      const anyCount = await any.count();
      if (anyCount >= 4 && anyCount <= 8) {
        const inputs = [];
        for (let i = 0; i < anyCount; i++) inputs.push(any.nth(i));
        return { scope, inputs };
      }
    } catch {}
  }
  return { scope: page, inputs: null };
}

// (opcional) antigo detector — mantido, mas CONNECT novo não depende dele
async function waitForOtpAcrossFrames(page, timeoutMs = 15000) {
  const deadline = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    const { otpInput } = await findOtpInputAcrossFrames(page);
    if (otpInput) {
      try { await otpInput.waitFor({ state: 'attached', timeout: 1000 }); } catch {}
      return otpInput;
    }
    await page.waitForTimeout(300);
  }
  return null;
}

// =====================================================================
// LOGIN (OAB+UF) OU (CPF/CNPJ)
// =====================================================================
async function findUserForLogin({ oab, uf, cpfCnpj }) {
  if (oab && uf) {
    const { data, error } = await supabase
      .from('users')
      .select('id, oab, uf, role, password_hash, cpf_cnpj')
      .eq('oab', oab)
      .eq('uf', uf)
      .limit(1)
      .single();
    if (error) return null;
    return data || null;
  }

  if (cpfCnpj) {
    const doc = onlyDigits(cpfCnpj);
    if (!(doc.length === 11 || doc.length === 14)) return null;

    
    const { data, error } = await supabase
    .from('users')
    .select('id, oab, uf, role, password_hash, cpf_cnpj')
    .eq('cpf_cnpj', doc)
    .limit(1)
    .maybeSingle();
    if (error) return null;
    return data || null;
  }

  return null;
}

// Health
app.get('/api/health', (_req, res) => ok(res));

// Quem sou eu (somente se autenticado)
app.get('/api/auth/me', requireAuth, (req, res) => {
  res.json({ ok: true, user: req.user });
});

// Login: aceita OAB+UF+senha OU cpfCnpj+senha
app.post('/api/auth/login', async (req, res) => {
  try {
    const { oab, uf, cpfCnpj, password } = req.body || {};
    if (!password) return bad(res, 400, 'missing credentials');

    const userRow = await findUserForLogin({ oab, uf, cpfCnpj });
    if (!userRow) return bad(res, 401, 'invalid');

    const passHash =
      userRow.password_hash || userRow.passwordHash || userRow.pass_hash || userRow.hash || '';
    const okPass = await bcrypt.compare(String(password), String(passHash));
    if (!okPass) return bad(res, 401, 'invalid');

    const extraClaims = {};
    if (cpfCnpj) {
      const d = onlyDigits(cpfCnpj);
      if (d.length === 11) extraClaims.cpf = d;
      if (d.length === 14) extraClaims.cnpj = d;
    }

    const token = signJWT(userRow, extraClaims);
    setAuthCookie(res, token);

    return res.json({
      ok: true,
      user: {
        id: userRow.id,
        oab: userRow.oab,
        uf: userRow.uf,
        cpf: userRow.cpf,
        cnpj: userRow.cnpj,
        role: userRow.role || 'advogado'
      }
    });
  } catch (e) {
    console.error(e);
    return bad(res, 500, 'internal');
  }
});

// Logout
app.post('/api/auth/logout', (_req, res) => {
  res.clearCookie(COOKIE_NAME, { path: '/', domain: COOKIE_DOMAIN });
  res.json({ ok: true });
});

// =====================================================================
// FLUXO TJSP (connect/otp/ping/status/resend)
// =====================================================================
const FLOWS = new Map(); // flowId -> { browser, context, page, storagePath, createdAt, lastPing, status, otpExpiresAt }
setInterval(() => {
  const t = Date.now();
  for (const [k, v] of FLOWS) {
    const last = v.lastPing || v.createdAt || t;
    if ((t - last) > FLOW_TTL_MS) {
      console.warn('[FLOW] TTL expirado, fechando navegador do flow', k);
      v.browser?.close().catch(() => {});
      FLOWS.delete(k);
    }
  }
}, 30_000);

// Protege as rotas /api/auth/tjsp/*
app.use('/api/auth/tjsp', (req, res, next) => requireAuth(req, res, next));

// CONNECT — abre ESAJ, preenche user/pass e decide: (a) já conectado, (b) aguardando OTP
app.post('/api/auth/tjsp/connect', requireAuth, async (req, res) => {
  // credenciais: body > .env
  const rawUser = String((req.body?.user ?? req.body?.cpfCnpj ?? process.env.TJSP_USER) || '');
  const pass    = String((req.body?.pass ?? req.body?.password ?? process.env.TJSP_PASSWORD) || '');
  const doc     = onlyDigits(rawUser);

  // valida antes de abrir navegador
  if (!(doc.length === 11 || doc.length === 14)) {
    return bad(res, 400, 'user_must_be_cpf_or_cnpj');
  }
  if (!pass || pass.length < 4) {
    return bad(res, 400, 'weak_password');
  }

  const browser = await chromium.launch({ headless: HEADLESS, slowMo: SLOW_MO });
  const context = await browser.newContext();
  const page = await context.newPage();

  try {
    await page.goto('https://esaj.tjsp.jus.br/esaj/cadastro.do', { waitUntil: 'domcontentloaded' });
    await page.waitForTimeout(300);
    await ensureCpfTab(page);

    const { userInput, passInput } = await findLoginInputsTJSP(page);
    if (!userInput || !passInput) throw new Error('Campos de login não encontrados');

    await safeFillStrict(userInput, rawUser);
    try { await page.evaluate(el => el.blur?.(), await userInput.elementHandle()); } catch {}
    await safeFillStrict(passInput, pass);

    // tolerante com máscara
    try {
      const gotUser = await userInput.inputValue();
      if (onlyDigits(gotUser) !== doc) {
        console.warn('[TJSP] usuario com máscara diferente', { typed: rawUser, got: gotUser });
      }
    } catch {}

    await clickLoginSmart(page, passInput);

    // ========= NOVO BLOCO: detectar OTP (campo único OU multi-caixas) =========
    let otpVisible = false;
    {
      const deadline = Date.now() + OTP_WAIT_MS;
      while (Date.now() < deadline && !otpVisible) {
        const { otpInput } = await findOtpInputAcrossFrames(page);
        if (otpInput) { otpVisible = true; break; }
        const { inputs } = await findOtpDigitBoxesAcrossFrames(page);
        if (inputs && inputs.length) { otpVisible = true; break; }
        await page.waitForTimeout(250);
      }
    }

    const flowId = randomUUID();
    const storagePath = path.join(os.tmpdir(), `tjsp-auth-${flowId}.json`);

    if (!otpVisible) {
      // tentar identificar erro de credenciais x login sem OTP
      const errLoc = page.locator('text=/senha|inválid|incorret|erro|falha|não foi possível/i').first();
      const hasErr = await errLoc.isVisible().catch(() => false);

      if (hasErr) {
        await Promise.allSettled([ page.close().catch(()=>{}), context.close().catch(()=>{}), browser.close().catch(()=>{}) ]);
        return bad(res, 401, 'invalid_credentials');
      }

      // sem OTP => consideramos conectado
      await context.storageState({ path: storagePath });
      try { await browser.close(); } catch {}
      FLOWS.set(flowId, {
        browser: null, context: null, page: null,
        storagePath, status: 'connected',
        createdAt: Date.now(), lastPing: Date.now()
      });
      return ok(res, { flowId, status: 'connected', storagePath });
    }

    // OTP visível (campo único ou multi-caixas): abre flow aguardando OTP
    FLOWS.set(flowId, {
      browser,
      context,
      page,                 // <— precisamos disso para digitar o OTP
      storagePath,
      status: 'awaiting-otp',
      createdAt: Date.now(),
      lastPing: Date.now(),
      otpExpiresAt: Date.now() + 180000 // 3 min (opcional)
    });

    return res.json({ ok: true, flowId, status: 'awaiting-otp', ttl: 180 });
  } catch (err) {
    await Promise.allSettled([ page?.close?.(), context?.close?.(), browser?.close?.() ]);
    return bad(res, 500, err?.message || String(err));
  }
});

// OTP — injeta código 2FA, salva storageState, mantém o flow por um tempo com status=connected
app.post('/api/auth/tjsp/otp', requireAuth, async (req, res) => {
  const { flowId, code, otp } = req.body || {};
  const flow = FLOWS.get(flowId);
  if (!flow) return res.status(404).json({ ok:false, error:'flow_not_found' });

  // normaliza: só dígitos
  const otpCode = String(code ?? otp ?? '').replace(/\D+/g,'');
  if (!otpCode) return res.status(400).json({ ok:false, error:'code obrigatório' });

  const { page, context, browser, storagePath } = flow;
  try {
    // 1) tenta campo único (lógica existente)
    const { otpInput } = await findOtpInputAcrossFrames(page);
    let typed = false;
    if (otpInput) {
      await safeFillStrict(otpInput, otpCode);
      typed = true;
    } else {
      // 2) fallback: 4–8 caixinhas de 1 dígito
      const { inputs } = await findOtpDigitBoxesAcrossFrames(page);
      if (!inputs || inputs.length === 0) {
        return res.status(410).json({ ok:false, error:'otp_input_missing' });
      }
      await inputs[0].scrollIntoViewIfNeeded().catch(()=>{});
      await inputs[0].click({ delay: 30 }).catch(()=>{});
      for (const ch of otpCode.split('')) {
        await page.keyboard.type(ch, { delay: 20 });
      }
      typed = true;
    }

    if (!typed) return res.status(410).json({ ok:false, error:'otp_input_missing' });

    // 3) confirmar (botão ou Enter)
    const confirm = page.getByRole('button', { name: /(confirmar|validar|entrar|continuar|acessar)/i }).first();
    if (await confirm.isVisible().catch(()=>false)) { await confirm.click({ delay: 60 }).catch(()=>{}); }
    else { try { await page.keyboard.press('Enter'); } catch {} }

    // 4) aguarda estabilizar, persiste sessão e encerra navegador
    await page.waitForLoadState('networkidle', { timeout: 30000 }).catch(()=>{});
    await context.storageState({ path: storagePath });

    // (opcional) salvar caminho na tabela users
    try {
      const { error: upErr } = await supabase
        .from('users')
        .update({ tjsp_storage_state_path: storagePath })
        .eq('id', req.user.sub);
      if (upErr) console.error('Falha ao salvar storage_state_path:', upErr);
    } catch {}

    try { await browser.close(); } catch {}
    flow.browser = null; flow.context = null; flow.page = null;
    flow.status = 'connected';
    flow.lastPing = Date.now();
    FLOWS.set(flowId, flow);

    return res.json({ ok: true, status: 'connected', storagePath });
  } catch (err) {
    try { await browser?.close?.(); } catch {}
    FLOWS.delete(flowId);
    return res.status(500).json({ ok:false, error: err?.message || String(err) });
  }
});

// Mantém o flow vivo enquanto o usuário busca o OTP no e-mail (POST/GET)
app.post('/api/auth/tjsp/ping', requireAuth, (req, res) => {
  const { flowId } = req.body || {};
  const flow = flowId && FLOWS.get(flowId);
  if (!flow) return bad(res, 404, 'flow_not_found');
  flow.lastPing = Date.now();
  return ok(res, { alive: true, ttlMs: FLOW_TTL_MS, status: flow.status || 'awaiting-otp' });
});
app.get('/api/auth/tjsp/ping', requireAuth, (req, res) => {
  const { flowId } = req.query || {};
  const flow = flowId && FLOWS.get(String(flowId));
  if (!flow) return bad(res, 404, 'flow_not_found');
  flow.lastPing = Date.now();
  return ok(res, { alive: true, ttlMs: FLOW_TTL_MS, status: flow.status || 'awaiting-otp' });
});

// Checa se a tela de OTP ainda está visível (campo único OU multi-caixas)
app.get('/api/auth/tjsp/status', requireAuth, async (req, res) => {
  const flowId = String(req.query.flowId || '');
  const flow = flowId && FLOWS.get(flowId);
  if (!flow) return bad(res, 404, 'flow_not_found');

  const { page } = flow;
  flow.lastPing = Date.now();

  try {
    if (!page) return ok(res, { alive: true, otpVisible: false, url: null, status: flow.status || 'connected' });

    let otpVisible = false;
    const { otpInput } = await findOtpInputAcrossFrames(page);
    if (otpInput) otpVisible = true;
    else {
      const { inputs } = await findOtpDigitBoxesAcrossFrames(page);
      if (inputs && inputs.length) otpVisible = true;
    }

    const url = page.url();
    return ok(res, {
      alive: true,
      otpVisible,
      url,
      status: flow.status || (otpVisible ? 'awaiting-otp' : 'connected')
    });
  } catch {
    return bad(res, 500, 'status_error');
  }
});

// Reenvio (stub seguro): confirma que o flow existe e renova o TTL
app.post('/api/auth/tjsp/resend', requireAuth, (req, res) => {
  const { flowId } = req.body || {};
  const flow = flowId && FLOWS.get(flowId);
  if (!flow) return bad(res, 404, 'flow_not_found');
  flow.lastPing = Date.now();
  return ok(res, { status: flow.status === 'connected' ? 'connected' : 'awaiting-otp' });
});

// =====================================================================
// OUTRAS ROTAS EXISTENTES (movements/processes/import)
// =====================================================================
const upload = multer({ storage: multer.memoryStorage() });

app.post('/api/movements/upsert', requireAuth, async (req, res) => {
  const schema = z.object({
    cnj: z.string(),
    items: z.array(z.object({
      moved_at: z.string(),
      description: z.string(),
      hash: z.string(),
      source_url: z.string().optional(),
      raw_html: z.string().optional(),
    }))
  });
  const parsed = schema.safeParse(req.body);
  if (!parsed.success) return bad(res, 400, 'invalid body');

  const { cnj, items } = parsed.data;
  const { error: e1 } = await supabase
    .from('processes')
    .upsert({ cnj }, { onConflict: 'cnj' })
    .select();
  if (e1) return bad(res, 500, e1.message);

  const rows = items.map(i => ({ process_cnj: cnj, ...i }));
  const { error: e2 } = await supabase
    .from('movements')
    .upsert(rows, { onConflict: 'process_cnj,hash', ignoreDuplicates: true });
  if (e2) return bad(res, 500, e2.message);

  return ok(res, { inserted: rows.length });
});

app.get('/api/processes/search', requireAuth, async (req, res) => {
  const { cnj } = req.query;

  let q = supabase
    .from('processes')
    .select(`
      cnj, classe, assunto, foro, vara, juiz, system, court,
      distribution_at, control_code, area, valor_acao, partes,
      last_scraped_at, last_detail_at
    `);

  if (cnj) q = q.eq('cnj', cnj);
  q = q.order('created_at', { ascending: false }).limit(100);

  const { data: procs, error } = await q;
  if (error) return bad(res, 500, error.message);

  const rows = [];
  for (const p of procs || []) {
    const { data: last } = await supabase
      .from('movements')
      .select('moved_at')
      .eq('process_cnj', p.cnj)
      .order('moved_at', { ascending: false })
      .limit(1);
    const lastMov = (last && last[0]?.moved_at) || null;

    rows.push({
      cnj: p.cnj,
      partes: Array.isArray(p.partes) && p.partes.length
        ? p.partes.map(x => `${x.role}: ${x.nome}`).join(' • ')
        : '—',
      foro: p.foro || '—',
      vara: p.vara || '—',
      sistema: p.system || 'TJSP-ESAJ',
      situacao: 'Em andamento',
      ultimaMov: lastMov ? new Date(lastMov).toLocaleDateString('pt-BR') : '—',
    });
  }

  res.json(rows);
});

app.get('/api/processes/:cnj/details', requireAuth, async (req, res) => {
  const { cnj } = req.params;

  const { data, error } = await supabase
    .from('processes')
    .select('*')
    .eq('cnj', cnj)
    .limit(1);

  if (error) return bad(res, 500, error.message);
  if (!data || !data.length) return bad(res, 404, 'not_found');

  const p = data[0];

    // helpers locais
  const brDate = (iso) => (iso ? new Date(iso).toLocaleDateString('pt-BR') : null);
  const sanitizeControlCode = (s) => {
    const m = String(s || '').match(/(\d{4})\s*\/\s*(\d{3,6})/);
    return m ? `${m[1]}/${m[2].padStart(6,'0')}` : null;
  };

  // tenta partes da tabela nova
  let partesNew = [];
  try {
    const { data: partsRows } = await supabase
      .from('process_parties')
      .select('role, name, document')
      .eq('process_cnj', cnj)
      .order('role', { ascending: true })
      .order('name', { ascending: true });

    if (Array.isArray(partsRows) && partsRows.length) {
      partesNew = partsRows.map(r => ({ role: r.role, nome: r.name, doc: r.document || null }));
    }
  } catch (_) {}

  // === NOVO: ler seções nas tabelas novas e converter para o formato do front
  const { data: petRows } = await supabase
    .from('process_petitions')
    .select('filed_at, type')
    .eq('process_cnj', cnj)
    .order('filed_at', { ascending: false });
  const peticoes = (petRows || []).map(r => ({ data: brDate(r.filed_at), tipo: r.type }));

  const { data: incRows } = await supabase
    .from('process_incidents')
    .select('filed_at, type, text')
    .eq('process_cnj', cnj)
    .order('filed_at', { ascending: false });
  const incidentes = (incRows || []).map(r => ({
    data: r.filed_at ? brDate(r.filed_at) : null,
    tipo: r.type || null,
    descricao: r.text
  }));

  const { data: apsRows } = await supabase
    .from('process_apensos')
    .select('apensado_em, numero, classe, motivo, text')
    .eq('process_cnj', cnj)
    .order('apensado_em', { ascending: false });
  const apensos = (apsRows || []).map(r => ({
    data: r.apensado_em ? brDate(r.apensado_em) : null,
    descricao: r.text || [r.numero, r.classe, r.motivo].filter(Boolean).join(' | ')
  }));

  const { data: audRows } = await supabase
    .from('process_hearings')
    .select('date_only, time_txt, scheduled_at, tipo, local, description')
    .eq('process_cnj', cnj)
    .order('scheduled_at', { ascending: false })
    .order('date_only', { ascending: false });
  const audiencias = (audRows || []).map(r => ({
    data: brDate(r.date_only || r.scheduled_at),
    hora: r.time_txt || (r.scheduled_at
      ? new Date(r.scheduled_at).toLocaleTimeString('pt-BR', { hour: '2-digit', minute: '2-digit' })
      : null),
    tipo: r.tipo || null,
    descricao: r.local ? `${r.description} — Local: ${r.local}` : r.description
  }));


  res.json({
    header: {
      cnj: p.cnj,
      classe: p.classe,
      assunto: p.assunto,
      foro: p.foro,
      vara: p.vara,
      juiz: p.juiz,
      distribution_at: p.distribution_at,
      control_code: sanitizeControlCode(p.control_code) || p.control_code || null,
      area: p.area,
      valor_acao: p.valor_acao,
      // se houver na tabela nova, usa; senão mantém o legado
      partes: partesNew.length ? partesNew : (p.partes || []),
    },
    extras: {
      peticoes:   p.peticoes   || [],
      incidentes: p.incidentes || [],
      apensos:    p.apensos    || [],
      audiencias: p.audiencias || [],
      peticoes:   peticoes.length   ? peticoes   : (p.peticoes   || []),
      incidentes: incidentes.length ? incidentes : (p.incidentes || []),
      apensos:    apensos.length    ? apensos    : (p.apensos    || []),
            audiencias: audiencias.length ? audiencias : (p.audiencias || []),
          }

  });
});


app.get('/api/processes/:cnj/movements', requireAuth, async (req, res) => {
  const { cnj } = req.params;
  const { data, error } = await supabase
    .from('movements')
    .select('moved_at, description')
    .eq('process_cnj', cnj)
    .order('moved_at', { ascending: false })
    .limit(200);
  if (error) return bad(res, 500, error.message);

  const out = (data || []).map(m => ({
    data: new Date(m.moved_at).toLocaleDateString('pt-BR'),
    movimentacao: m.description,
  }));
  res.json(out);
});

app.post('/api/processes/import-csv', requireAuth, upload.single('file'), async (req, res) => {
  if (!req.file) return bad(res, 400, 'missing file');
  const text = req.file.buffer.toString('utf8');
  const lines = text.split(/\r?\n/).map(s => s.trim()).filter(Boolean);
  const cnjs = [];
  for (const line of lines) {
    const m = line.match(/\d{7}-\d{2}\.\d{4}\.\d\.\d{2}\.\d{4}/);
    if (m) cnjs.push(m[0]);
  }
  if (cnjs.length === 0) return ok(res, { imported: 0 });

  const rows = cnjs.map(cnj => ({ cnj }));
  const { error } = await supabase
    .from('processes')
    .upsert(rows, { onConflict: 'cnj' });

  if (error) return bad(res, 500, error.message);
  ok(res, { imported: rows.length });
});

// ---------------------------------------------------------------------
// PARTES DO PROCESSO (tabela process_parties)
// GET /api/processes/:cnj/parties
// ---------------------------------------------------------------------
app.get('/api/processes/:cnj/parties', requireAuth, async (req, res) => {
  const cnj = String(req.params.cnj || '');
  if (!cnj) return bad(res, 400, 'missing cnj');

  const { data, error } = await supabase
    .from('process_parties')
    .select('role, name, document')
    .eq('process_cnj', cnj)
    .order('role', { ascending: true })
    .order('name', { ascending: true });

  if (error) return bad(res, 500, error.message);
  // shape simples para o front
  return res.json((data || []).map(r => ({
    role: r.role,
    name: r.name,
    document: r.document || null,
  })));
});



// =====================================================================
// START
// =====================================================================
const PORT = process.env.PORT || 8000;
app.get('/api/_version', (_req, res) => {
  res.json({ sig: 'tjsp-auth-real-v3', time: new Date().toISOString() });
});
app.listen(PORT, () => console.log(`API on http://localhost:${PORT}`));
