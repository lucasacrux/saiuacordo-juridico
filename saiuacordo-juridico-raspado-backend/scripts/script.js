// scripts/scrape_one.js — TJSP/ESAJ scraper (estilo unificado)
// Node 18+, Playwright Chromium. Supabase upserts idempotentes.
// Captura SEMPRE: Header, Partes, Movimentações, Petições diversas, Incidentes/Recursos/Execuções,
// Apensos/Entranhados/Unificados, Audiências.

import 'dotenv/config';
import { chromium } from 'playwright';
import { createClient } from '@supabase/supabase-js';
import crypto from 'node:crypto';
import readline from 'node:readline/promises';
import fs from 'node:fs/promises';
import { stdin as input, stdout as output } from 'node:process';

const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const sha1 = (s) => crypto.createHash('sha1').update(s).digest('hex');

// ==================== Helpers gerais / ENV ====================
function getEnv(...names) {
  for (const n of names) {
    const v = (process.env[n] || '').trim();
    if (v) return v;
  }
  return '';
}
const HEADLESS = String(process.env.HEADLESS || '').trim() === '0' ? false : true;
const SLOWMO   = Number(process.env.PW_SLOWMO || 120);
const USE_RAW_HTML = String(process.env.ENABLE_RAW_HTML || '').trim() === '1';
const SENTINEL_DATE = '1970-01-01';

// ==================== Login ESAJ ====================
async function findInputByLabel(page, labelRegex) {
  const lbl = page.locator('label, span, div').filter({ hasText: labelRegex }).first();
  if (await lbl.count() === 0) return null;

  const forAttr = await lbl.getAttribute('for').catch(() => null);
  if (forAttr) {
    const byId = page.locator(`[id="${forAttr}"]`);
    if (await byId.isVisible().catch(() => false)) return byId;
  }

  const candidate = lbl.locator('xpath=following::input[1]').first();
  if (await candidate.isVisible().catch(() => false)) return candidate;

  const parentInput = lbl.locator('..').locator('input').first();
  if (await parentInput.isVisible().catch(() => false)) return parentInput;

  return null;
}
async function setInputValueHard(locator, value) {
  await locator.evaluate((el, v) => {
    el.focus?.();
    if ('select' in el && typeof el.select === 'function') el.select();
    if ('value' in el) el.value = v;
    else el.setAttribute('value', v);
    el.dispatchEvent(new Event('input', { bubbles: true }));
    el.dispatchEvent(new Event('change', { bubbles: true }));
    el.dispatchEvent(new Event('blur', { bubbles: true }));
  }, value);
}
async function safeFillLikeTyping(page, locator, value) {
  const val = String(value);
  await locator.scrollIntoViewIfNeeded().catch(() => {});
  await locator.click({ clickCount: 3 }).catch(() => {});
  await locator.fill('').catch(() => {});
  try {
    await locator.focus();
    await page.keyboard.insertText(val);
    const cur = await locator.inputValue().catch(() => null);
    if (cur === val) return 'insertText';
  } catch {}
  try {
    await locator.fill(val);
    const cur = await locator.inputValue().catch(() => null);
    if (cur === val) return 'fill';
  } catch {}
  try {
    await setInputValueHard(locator, val);
    const cur = await locator.inputValue().catch(() => null);
    if (cur === val) return 'hard';
  } catch {}
  return 'failed';
}
async function ensureCpfTab(page) {
  try {
    const tab = page.getByRole('tab', { name: /cpf\s*\/\s*cnpj/i }).first();
    if (await tab.isVisible().catch(() => false)) {
      await tab.click({ delay: 50 }).catch(() => {});
      await page.waitForTimeout(200);
    }
  } catch {}
}
async function findLoginInputsStrict(page) {
  let passInput = await findInputByLabel(page, /(senha|password)/i);
  if (!passInput) {
    const loc = page.locator('form:has(input[type="password"]) input[type="password"]').first();
    passInput = (await loc.count()) ? loc : null;
  }
  if (!passInput) {
    const loc = page.locator('input[type="password"]').first();
    passInput = (await loc.count()) ? loc : null;
  }
  if (!passInput) return { userInput: null, passInput: null };

  const form = passInput.locator('xpath=ancestor::form[1]');
  let userInput = form.locator(
    'input:not([type="password"]):not([type="hidden"]):not([disabled])'
  ).filter({ hasNotText: '' }).first();

  const preferred = form.locator([
    'input[name*="cpf" i]', 'input[id*="cpf" i]',
    'input[name*="cnpj" i]','input[id*="cnpj" i]',
    'input[name*="usuario" i]','input[id*="usuario" i]',
    'input[name*="login" i]','input[id*="login" i]'
  ].join(', ')).first();
  if (await preferred.count()) userInput = preferred;

  if (!(await userInput.count())) {
    userInput = await findInputByLabel(page, /(cpf\/?cnpj|cpf|cnpj|usu[aá]rio|login)/i);
  }

  if (!(await userInput?.count?.())) return { userInput: null, passInput };

  const [uEl, pEl] = await Promise.all([userInput.elementHandle(), passInput.elementHandle()]);
  if (uEl && pEl) {
    const same = await page.evaluate((a,b)=> a===b, uEl, pEl).catch(()=>false);
    if (same) {
      const alt = form.locator('input[type="text"], input[type="email"], input').filter({ hasNot: form.locator('input[type="password"]') }).first();
      if (await alt.count()) userInput = alt;
    }
  }
  return { userInput, passInput };
}

// 2FA por e-mail (gancho opcional — desativado por padrão)
async function tryHandle2FAFromEmail(page) {
  if (process.env.ENABLE_2FA_EMAIL !== '1') return false;
  console.log('[2FA] Aguardando código por e-mail… (gancho pronto; implementar leitura de caixa postal)');
  return false;
}

async function autoLoginESAJ(page, rl, creds = {}) {
  const uiUser = (creds.user ?? '').trim();
  const uiPass = (creds.pass ?? '').trim();
  const envUser = getEnv('TJSP_USER', 'TJSP_USUARIO', 'TJSP_LOGIN', 'TJSP_CPF', 'TJS_PUSUARIO');
  const envPass = getEnv('TJSP_PASSWORD', 'TJSPPASSWORD');
  const user = uiUser || envUser;
  const pass = uiPass || envPass;

  const loginUrl = 'https://esaj.tjsp.jus.br/esaj/cadastro.do';
  await page.goto(loginUrl, { waitUntil: 'domcontentloaded' });
  await page.waitForTimeout(300);
  await ensureCpfTab(page);

  if (!user || !pass) {
    console.warn('[LOGIN] Sem credenciais. Faça manualmente e conclua o 2FA.');
    await rl.question('Depois do 2FA, pressione Enter aqui... ');
    return;
  }

  const { userInput, passInput } = await findLoginInputsStrict(page);
  if (!userInput) {
    console.warn('[LOGIN] Não achei campo de usuário. Faça manual e conclua o 2FA.');
    await rl.question('Depois do 2FA, pressione Enter aqui... ');
    return;
  }
  const stratUser = await safeFillLikeTyping(page, userInput, user);
  console.log(`[LOGIN] Usuário via ${stratUser}.`);
  await page.keyboard.press('Tab');
  await page.waitForTimeout(80);

  try {
    const focusIsPass = await page.locator('input[type="password"]').isFocused();
    if (!focusIsPass && passInput) await passInput.focus();
  } catch {}
  await page.keyboard.type(pass, { delay: 50 });
  console.log('[LOGIN] Senha digitada por teclado.');

  await page.keyboard.press('Tab');
  await page.keyboard.press('Tab');
  await page.keyboard.press('Enter');

  await Promise.race([
    page.waitForURL((u) => !/cadastro\.do/i.test(u), { timeout: 15000 }).catch(() => null),
    page.waitForNavigation({ waitUntil: 'domcontentloaded', timeout: 15000 }).catch(() => null),
    page.waitForLoadState('domcontentloaded', { timeout: 15000 }).catch(() => null),
  ]);

  console.log('[LOGIN] Se aparecer 2FA, tento preencher automaticamente (se habilitado) ou aguardo.');
  const auto2fa = await tryHandle2FAFromEmail(page).catch(()=>false);
  if (!auto2fa) {
    await rl.question('Quando concluir o 2FA e o portal liberar, pressione Enter aqui... ');
  }
  await page.waitForLoadState('networkidle').catch(() => {});
  await page.waitForTimeout(400);

  const now = page.url();
  if (/cadastro\.do/i.test(now)) {
    console.warn('[LOGIN] Ainda parece na tela de login. Tentando botão de Entrar (fallback).');
    const btn = page.getByRole('button', { name: /(entrar|acessar|login|autenticar)/i }).first();
    if (await btn.isVisible().catch(() => false)) {
      await btn.click({ delay: 60 }).catch(() => {});
      await page.waitForLoadState('networkidle').catch(() => {});
    }
  }
}

// ==================== Utils ====================
function toISOFromBR(d) {
  const m = (d || '').match(/(\d{2})\/(\d{2})\/(\d{4})/);
  if (!m) return null;
  const [, dd, mm, yyyy] = m;
  return `${yyyy}-${mm}-${dd}`;
}
const toNumberBRL = (s) => {
  if (s === null || s === undefined) return null;
  const n = Number(
    String(s).replace(/\s/g,'').replace(/[R$\u00A0]/g,'').replace(/\./g,'').replace(',', '.').replace(/[^\d.\-]/g,'')
  );
  return Number.isFinite(n) ? n : null;
};

// ===== Helpers cross-frame =====
async function runInAllFrames(page, extractorFn) {
  const scopes = [page, ...page.frames()];
  let acc = [];
  for (const scope of scopes) {
    try {
      const arr = await extractorFn(scope);
      if (Array.isArray(arr)) acc.push(...arr);
    } catch {}
  }
  const seen = new Set();
  return acc.filter(x => {
    const key = JSON.stringify(x).toLowerCase();
    if (seen.has(key)) return false;
    seen.add(key);
    return true;
  });
}

// ==================== Helpers de seção — estilo Movimento ====================
async function findApensosContainer(scope) {
  try {
    const handle = await scope.evaluateHandle(() => {
      const headerRx = /(apensos?|entranhad[oa]s?|unificad[oa]s?)/i;
      const norm = (s) => (s||'').replace(/\s+/g,' ').trim();
      const titles = Array.from(document.querySelectorAll('h1,h2,h3,h4,legend,strong,div,span'))
        .filter(el => headerRx.test(norm(el.textContent||'')));
      if (!titles.length) return null;
      let best = null, bestScore = -1;
      for (const t of titles) {
        const sec = t.closest('section,fieldset,article,div') || t.parentElement || document;
        const score = sec.querySelectorAll('tr,td,th,li,p,div,span').length;
        if (score > bestScore) { best = sec; bestScore = score; }
      }
      return best || document.body;
    });
    return (await handle.asElement()) ? handle : null;
  } catch { return null; }
}


// encontra o container "largo" próximo ao título
async function findSectionContainerLoose(scope, headerRx) {
  try {
    const handle = await scope.evaluateHandle((rxStr) => {
      const rx = new RegExp(rxStr, 'i');
      const norm = (s) => (s||'').replace(/\s+/g,' ').trim();

      const titles = Array.from(document.querySelectorAll('h1,h2,h3,h4,legend,strong,div,span'))
        .filter(el => rx.test(norm(el.textContent||'')));
      if (!titles.length) return null;

      let best = null, bestScore = -1;
      for (const t of titles) {
        const sec = t.closest('section,fieldset,article,div') || t.parentElement || document;
        const score = sec.querySelectorAll('tr,td,th,li,p,div,span').length;
        if (score > bestScore) { best = sec; bestScore = score; }
      }
      return best || document.body;
    }, headerRx.source);
    return (await handle.asElement()) ? handle : null;
  } catch { return null; }
}

// expande “ver mais / exibir / todas” DENTRO do container
async function expandAllInside(scope, containerHandle) {
  try {
    for (let round = 0; round < 6; round++) {
      const clicked = await containerHandle.evaluate((sec) => {
        const labels = [
          /ver\s+mais/i, /exibir/i, /mostrar\s+mais/i, /visualizar/i,
          /todas/i, /expandir/i, /mais\s+itens/i, /carregar\s+mais/i
        ];
        let did = false;
        const btns = Array.from(sec.querySelectorAll('a,button,input[type="button"],span[role="button"]'))
          .filter(el => el.offsetParent !== null);
        for (const b of btns) {
          const t = (b.innerText || b.textContent || b.value || '').replace(/\s+/g,' ').trim();
          if (labels.some(rx => rx.test(t))) { b.click(); did = true; }
        }
        // rola o container para forçar carregamento lazy
        sec.scrollTop = sec.scrollHeight;
        window.scrollTo(0, document.body.scrollHeight);
        return did;
      });
      await scope.waitForLoadState?.('networkidle').catch(()=>{});
      await scope.waitForTimeout?.(700).catch(()=>{});
      if (!clicked) break;
    }
  } catch {}
}

// status/html da seção (abordagem “larga”)
async function getSectionStatusLoose(page, headerRx) {
  const scopes = [page, ...page.frames()];
  for (const scope of scopes) {
    try {
      const root = await findSectionContainerLoose(scope, headerRx);
      if (!root) continue;
      const { empty, html } = await root.evaluate((sec) => {
        const norm = (s) => (s||'').replace(/\s+/g,' ').trim();
        const txt = norm(sec.textContent||'');
        const isEmpty = /(não\s+h[aá]\s+dados|nao\s+ha\s+dados|sem\s+registros|sem\s+registro|nenhum\s+dado|nenhuma\s+informa[cç][aã]o|nenhum\s+resultado)/i.test(txt);
        return { empty: isEmpty, html: sec.outerHTML };
      });
      return { exists: true, empty, raw_html: USE_RAW_HTML ? html : null, scope, root };
    } catch {}
  }
  return { exists: false, empty: false, raw_html: null, scope: null, root: null };
}

// captura HTML bruto do container (quando habilitado)
async function getSectionHTMLLike(page, headerRx) {
  if (!USE_RAW_HTML) return null;
  try {
    const st = await getSectionStatusLoose(page, headerRx);
    if (!st.root) return await page.content();
    return await st.root.evaluate((sec) => sec.outerHTML);
  } catch { return null; }
}

function sanitizeClasse(s) {
  if (!s) return null;
  const x = String(s).trim();
  if (/^apens(o|os|ado|ados|amento)s?$/i.test(x)) return null;
  if (/^apenso\s+a\s+/i.test(x)) return null;
  return x;
}

// ==================== Seleção “estrita” por cabeçalho (para header/partes) ====================
async function sliceSectionByHeader(page, headerRx) {
  return await page.evaluateHandle((rxStr) => {
    const norm = (s) => (s || "").replace(/\s+/g, " ").trim();
    const headerRX = new RegExp(rxStr, "i");
    const isSectionTitle = (t) =>
      /(movimenta|peti(?:ç|c)ões|diversas|incident|recurso|execu(?:ç|c)[aã]o|apenso|entranhad|unificad|audi(?:ê|e)ncia|sess[aã]o|partes|autos|dados\s+do\s+processo|resumo|inform[aã]o|informac|capa)/i
        .test(norm(t));

    const all = Array.from(document.querySelectorAll("h1,h2,h3,h4,legend,strong,div,span"));
    const idx = all.findIndex((el) => headerRX.test(norm(el.textContent)));
    if (idx === -1) return null;

    let parent = all[idx].parentElement;
    while (parent && parent !== document.body) {
      const titlesCount = Array.from(parent.querySelectorAll("h1,h2,h3,h4,legend,strong,div,span"))
        .filter((el) => isSectionTitle(el.textContent)).length;
      if (titlesCount >= 2) break;
      parent = parent.parentElement;
    }
    if (!parent) parent = document.body;

    let start = -1, end = parent.children.length;
    for (let i = 0; i < parent.children.length; i++) {
      if (parent.children[i].contains(all[idx])) { start = i; break; }
    }
    if (start === -1) return null;

    for (let j = start + 1; j < parent.children.length; j++) {
      const t = norm(parent.children[j].textContent || "");
      if (isSectionTitle(t)) { end = j; break; }
    }

    const wrapper = document.createElement("div");
    for (let k = start; k < end; k++) {
      wrapper.appendChild(parent.children[k].cloneNode(true));
    }
    return wrapper;
  }, headerRx.source);
}
async function expandSectionByHeader(page, headerRx) {
  const handle = await sliceSectionByHeader(page, headerRx);
  if (!handle) return false;
  const clicked = await handle.evaluate((sec) => {
    const labels = [/ver\s+mais/i, /exibir/i, /mostrar\s+mais/i, /visualizar/i, /todas/i, /expandir/i];
    const btns = Array.from(sec.querySelectorAll('a,button,input[type="button"],span[role="button"]'))
      .filter(el => el.offsetParent !== null);
    for (const b of btns) {
      const t = (b.innerText || b.textContent || b.value || '').trim();
      if (labels.some(rx => rx.test(t))) { b.click(); return true; }
    }
    return false;
  });
  if (clicked) {
    await page.waitForLoadState('networkidle').catch(()=>{});
    await page.waitForTimeout(700);
  }
  return clicked;
}

// ==================== Header ====================
async function expandHeaderDetails(page) {
  const headerHandle = await page.evaluateHandle(() => {
    const looksLikeHeader = (el) => {
      const t = (el.textContent || '').toLowerCase();
      return /classe|assunto|foro|vara|ju[ií]z|distribui|controle|area|área|valor/.test(t);
    };
    const nodes = Array.from(document.querySelectorAll('section,fieldset,article,div'));
    let best = null, bestScore = -1;
    for (const sec of nodes) {
      const score = Array.from(sec.querySelectorAll('*')).filter(looksLikeHeader).length;
      if (score > bestScore) { best = sec; bestScore = score; }
    }
    return best || document.body;
  });
  const clicked = await page.evaluate(async (sec) => {
    const labels = [/ver mais/i, /exibir mais/i, /mostrar mais/i, /visualizar mais/i, /ver detalhes/i];
    const buttons = Array.from(sec.querySelectorAll('a,button,input[type="button"]'))
      .filter(el => el.offsetParent !== null);
    for (const b of buttons) {
      const txt = (b.innerText || b.value || b.textContent || '').trim();
      if (labels.some(rx => rx.test(txt))) { b.click(); return true; }
    }
    return false;
  }, headerHandle);
  if (clicked) {
    await page.waitForLoadState('networkidle').catch(() => {});
    await page.waitForTimeout(800);
  }
}
async function extractHeaderBasic(page) {
  return await page.evaluate(() => {
    const txt = (el) => (el?.textContent || '').replace(/\s+/g, ' ').trim();
    const getAfter = (labelRx) => {
      for (const lab of Array.from(document.querySelectorAll('dt,th,strong,label,span,div'))) {
        const t = txt(lab);
        if (!labelRx.test(t)) continue;

        if (lab.tagName === 'DT' && lab.nextElementSibling?.tagName === 'DD') {
          const v = txt(lab.nextElementSibling);
          if (v && !labelRx.test(v)) return v;
        }
        if (lab.nextElementSibling) {
          const v = txt(lab.nextElementSibling);
          if (v && !labelRx.test(v)) return v;
        }
        const v2 = lab.parentElement?.querySelector('dd,span,div');
        if (v2) {
          const v = txt(v2);
          if (v && !labelRx.test(v)) return v;
        }
      }
      return null;
    };

    const classe       = getAfter(/^\s*classe\s*:?\s*$/i)    || getAfter(/classe/i);
    const assunto      = getAfter(/^\s*assunto\s*:?\s*$/i)   || getAfter(/assunto/i);
    const foro         = getAfter(/^\s*foro\s*:?\s*$/i)      || getAfter(/foro/i);
    const vara         = getAfter(/^\s*vara\s*:?\s*$/i)      || getAfter(/vara/i);
    const juiz         = getAfter(/^\s*ju[ií]z\s*:?\s*$/i)   || getAfter(/ju[ií]z/i);
    const distribuicao = getAfter(/distribui[cç][aã]o/i);
    const controle     = getAfter(/controle/i);
    const area         = getAfter(/^\s*[áa]rea\s*:?\s*$/i)   || getAfter(/^\s*area\s*:?\s*$/i);
    const valorAcao    = getAfter(/valor\s+da\s+a[cç][aã]o/i);

    return { classe, assunto, foro, vara, juiz, distribuicao, controle, area, valorAcao };
  });
}
async function extractCaseSummary(page) {
  const raw = await page.evaluate(() => {
    const norm = (s) => (s || '').replace(/\s+/g, ' ').trim();
    const nfd  = (s) => norm(s).normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
    const CNJ_RX = /\b\d{7}-\d{2}\.\d{4}\.\d\.\d{2}\.\d{4}\b/;

    let header = document.body, best = -1;
    const looksHeader = (el) =>
      /classe|assunto|foro|vara|ju[ií]z|distribui|controle|area|área|valor/i.test(el.textContent || '');
    for (const sec of Array.from(document.querySelectorAll('section,fieldset,article,div'))) {
      const score = Array.from(sec.querySelectorAll('*')).filter(looksHeader).length;
      if (score > best) { best = score; header = sec; }
    }

    const LABELS = {
      classe:       ['classe'],
      assunto:      ['assunto','assuntos'],
      foro:         ['foro','comarca','circunscricao'],
      vara:         ['vara','juizado','unidade judiciaria'],
      juiz:         ['juiz','juiza','magistrado','magistrada'],
      distribution: ['distribuicao','data de distribuicao','data da distribuicao'],
      controlCode:  ['controle','numero do controle','nº do controle','n o do controle','n do controle'],
      area:         ['area','area do direito'],
      valor:        ['valor da acao','valor da causa','valor da demanda'],
    };

    const ALL_KEYS = Object.values(LABELS).flat().map(nfd);
    const isPureLabel = (text) => {
      const t = nfd(text);
      return ALL_KEYS.some(k => t === k || t === k + ':' || t === k + ' :');
    };
    const isLabelNode = (text, keys) => {
      const t = nfd(text);
      return keys.some(k => t === k || t.startsWith(k + ':') || t === k + ' :');
    };

    const nodes = Array.from(header.querySelectorAll('dt,th,strong,label,span,div'));
    function valueNear(node) {
      if (node.tagName === 'DT' &&
          node.nextElementSibling &&
          node.nextElementSibling.tagName === 'DD') {
        const v = norm(node.nextElementSibling.textContent);
        if (v && !isPureLabel(v) && !CNJ_RX.test(v)) return v;
      }
      const parent = node.parentElement;
      if (parent) {
        const kids = Array.from(parent.children);
        const idx = kids.findIndex(ch => ch === node || ch.contains(node));
        for (let i = idx + 1; i < kids.length && i <= idx + 8; i++) {
          const v = norm(kids[i].textContent || '');
          if (!v) continue;
          if (isPureLabel(v)) break;
          if (CNJ_RX.test(v)) continue;
          return v;
        }
      }
      let cur = node.nextElementSibling;
      for (let step = 0; step < 6 && cur; step++, cur = cur.nextElementSibling) {
        const v = norm(cur.textContent || '');
        if (!v) continue;
        if (isPureLabel(v)) break;
        if (CNJ_RX.test(v)) continue;
        return v;
      }
      const txt = norm(node.textContent || '');
      if (txt.includes(':')) {
        const parts = txt.split(':');
        if (parts.length >= 2) {
          const v = norm(parts.slice(1).join(':'));
          if (v && !isPureLabel(v) && !CNJ_RX.test(v)) return v;
        }
      }
      return null;
    }
    function getValue(keys) {
      for (const node of nodes) {
        if (!isLabelNode(node.textContent || '', keys)) continue;
        const v = valueNear(node);
        if (v) return v;
      }
      for (const tb of Array.from(header.querySelectorAll('table'))) {
        for (const tr of Array.from(tb.querySelectorAll('tr'))) {
          const tds = Array.from(tr.querySelectorAll('th,td'));
          if (tds.length < 2) continue;
          const a = tds[0]?.textContent || '';
          const b = tds[1]?.textContent || '';
          if (isLabelNode(a, keys)) {
            const v = norm(b);
            if (v && !isPureLabel(v)) return v;
          }
        }
      }
      return null;
    }

    const out = {};
    for (const [key, labels] of Object.entries(LABELS)) {
      out[key] = getValue(labels.map(nfd));
    }
    return out;
  });

  const toISO = (s) => {
    if (!s) return null;
    const m = String(s).match(/(\d{2})\/(\d{2})\/(\d{4})/);
    if (!m) return null;
    const [, dd, mm, yyyy] = m;
    const t = String(s).match(/(\d{2}):(\d{2})/);
    if (t) return `${yyyy}-${mm}-${dd}T${t[1]}:${t[2]}:00`;
    return `${yyyy}-${mm}-${dd}T00:00:00`;
  };

  return {
    classe: raw.classe || null,
    assunto: raw.assunto || null,
    foro: raw.foro || null,
    vara: raw.vara || null,
    juiz: raw.juiz || null,
    distribution_at: toISO(raw.distribution),
    control_code: raw.controlCode || null,
    area: raw.area || null,
    valor_acao: toNumberBRL(raw.valor),
  };
}
async function extractHeaderFromSection(page) {
  const handle = await sliceSectionByHeader(
    page,
    /(dados\s+do\s+processo|inform[aã]ç(?:[oõ]es?)\s+do\s+processo|resumo|capa|autos)/i
  );
  if (!handle) return {};
  const raw = await handle.evaluate((root) => {
    const norm = (s) => (s||'').replace(/\s+/g,' ').trim();
    const nfd  = (s) => norm(s).normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
    const LABELS = {
      classe:       ['classe'],
      assunto:      ['assunto','assuntos'],
      foro:         ['foro','comarca','circunscricao'],
      vara:         ['vara','juizado','unidade judiciaria'],
      juiz:         ['juiz','juiza','magistrado','magistrada'],
      distribution: ['distribuicao','data de distribuicao','data da distribuicao'],
      controlCode:  ['controle','numero do controle','nº do controle','n o do controle','n do controle'],
      area:         ['area','area do direito'],
      valor:        ['valor da acao','valor da causa','valor da demanda'],
    };
    const ALL = Object.values(LABELS).flat().map(nfd);
    const isLabelTxt = (t) => {
      const x = nfd(t);
      return ALL.some(k => x === k || x.startsWith(k + ':') || x === k + ' :');
    };
    const valNear = (node) => {
      const p = node.parentElement;
      if (p) {
        const kids = Array.from(p.children);
        const i = kids.findIndex(ch => ch === node || ch.contains(node));
        for (let j=i+1;j<kids.length && j<=i+6;j++){
          const v = (kids[j].textContent||'').replace(/\s+/g,' ').trim();
          if (v && !isLabelTxt(v)) return v;
        }
      }
      let cur=node.nextElementSibling;
      for (let s=0;s<5 && cur;s++,cur=cur.nextElementSibling){
        const v = (cur.textContent||'').replace(/\s+/g,' ').trim();
        if (v && !isLabelTxt(v)) return v;
      }
      const t = (node.textContent||'').replace(/\s+/g,' ').trim();
      if (t.includes(':')) {
        const parts = t.split(':');
        if (parts.length>=2) {
          const v = parts.slice(1).join(':').replace(/\s+/g,' ').trim();
          if (v && !isLabelTxt(v)) return v;
        }
      }
      return null;
    };
    const nodes = Array.from(root.querySelectorAll('dt,th,strong,label,span,div'));
    const out = {};
    for (const [key, labels] of Object.entries(LABELS)) {
      const keys = labels.map(nfd);
      for (const n of nodes) {
        const t = n.textContent || '';
        const nt = nfd(t);
        if (keys.some(k => nt === k || nt.startsWith(k + ':') || nt === k + ' :')) {
          const v = valNear(n);
          if (v) { out[key] = v; break; }
        }
      }
    }
    return out;
  });

  const toISO = (s) => {
    if (!s) return null;
    const m = String(s).match(/(\d{2})\/(\d{2})\/(\d{4})/);
    if (!m) return null;
    const [, dd, mm, yyyy] = m;
    return `${yyyy}-${mm}-${dd}T00:00:00`;
  };
  return {
    classe: raw.classe || null,
    assunto: raw.assunto || null,
    foro: raw.foro || null,
    vara: raw.vara || null,
    juiz: raw.juiz || null,
    distribution_at: toISO(raw.distribution),
    control_code: raw.controlCode || null,
    area: raw.area || null,
    valor_acao: toNumberBRL(raw.valor),
  };
}

// ==================== Partes ====================
async function extractPartes(page) {
  async function expandPartesIn(scope) {
    try {
      await scope.evaluate(() => {
        const norm = s => (s||'').replace(/\s+/g,' ').trim();
        const headerRx = /(partes\s*(do|da)?\s*processo|partes e representantes|polo\s+ativo|polo\s+passivo)/i;
        const labels = [/ver\s+mais/i,/exibir/i,/mostrar\s+mais/i,/todas/i,/expandir/i];
        const titles = Array.from(document.querySelectorAll('h1,h2,h3,h4,legend,strong,div,span'))
          .filter(el => headerRx.test(norm(el.textContent)));
        const sec = (titles[0]?.closest('section,fieldset,article,div') || titles[0]?.parentElement) || document;
        const btns = Array.from(sec.querySelectorAll('a,button,input[type="button"],span[role="button"]'))
          .filter(el => el.offsetParent !== null);
        for (const b of btns) {
          const t = norm(b.innerText || b.textContent || b.value || '');
          if (labels.some(rx => rx.test(t))) b.click();
        }
      });
      await page.waitForTimeout(500);
    } catch {}
  }

  async function runIn(scope) {
    return await scope.evaluate(() => {
      const norm   = s => (s||'').replace(/\s+/g,' ').trim();
      const visible= el => el && el.offsetParent !== null;

      const ROLE_RX = '(?:autor(?:a)?|requerente|requerid[oa]|r[eé]u|reqte\\.?|reqda\\.?|reqdo\\.?' +
      '|apelant[ea]|apelad[oa]|embargant[ea]|embargad[oa]|agravant[ea]|agravad[oa]' +
      '|exequente|exeqte\\.?|exeqt[oa]\\.?' +
      '|exec(?:ut)?ad[oa]|exectd[oa]' +
      '|impetrant[ea]|impetrad[oa]|reclamant[ea]|reclamad[oa]' +
      '|assistente|terceiro(?:\\s+interessado)?|amicus\\s+curiae)';
      const ROLE    = new RegExp('^'+ROLE_RX+'$', 'i');
      const ROLE_INLINE = new RegExp('^\\s*(' + ROLE_RX + ')\\s*[:.\\-–—]?\\s*(.+)$', 'i');
      const cleanRole = s => norm((s||'').replace(/[:.]\s*$/,''));

      const pickDoc = (text) => {
        const mDoc = String(text||'').match(/\b(CPF|CNPJ)\s*[:\-]?\s*([\d.\-\/]+)/i);
        if (mDoc) return mDoc[0].trim();
        const mOab = String(text||'').match(/\bOAB\b[^0-9A-Z]*([A-Z]{2})?\s*([\d.\-\/A-Z]+)/i);
        if (mOab) {
          const uf = mOab[1] ? (mOab[1].toUpperCase()+' ') : '';
          return `OAB ${uf}${(mOab[2]||'').replace(/\s+/g,'')}`;
        }
        return null;
      };

      const pushMany = (acc, role, rawText) => {
        role = cleanRole(role);
        if (!rawText) return;
        const chunks = String(rawText).split(/Advogad[oa]\s*:\s*/i);
        const parteTxt = norm(chunks.shift() || '');
        if (ROLE.test(role) && parteTxt) {
          acc.push({ role, nome: parteTxt, doc: pickDoc(parteTxt) });
        }
        for (const advRaw of chunks) {
          const advTxt = norm((advRaw.split(/\n/)[0] || '').replace(/^[\-–—:\s]+/, ''));
          if (!advTxt) continue;
          acc.push({ role: `Advogado do ${role}`, nome: advTxt, doc: pickDoc(advTxt) });
        }
      };

      const headerRx = /(partes\s*(do|da)?\s*processo|partes e representantes|polo\s+ativo|polo\s+passivo)/i;
      const titles = Array.from(document.querySelectorAll('h1,h2,h3,h4,legend,strong,div,span'))
        .filter(el => headerRx.test(norm(el.textContent)));
      const root = (titles[0]?.closest('section,fieldset,article,div') || titles[0]?.parentElement) || document;

      const out = [];

      // 1) Tabelas
      for (const tb of root.querySelectorAll('table')) {
        for (const tr of tb.querySelectorAll('tr')) {
          const tds = Array.from(tr.querySelectorAll('td,th'));
          if (!tds.length) continue;

          if (tds.length >= 2) {
            const left  = cleanRole(norm(tds[0].innerText || tds[0].textContent || ''));
            const right = norm(tds.slice(1).map(td => td.innerText || td.textContent || '').join(' '));
            if (ROLE.test(left) && right) { pushMany(out, left, right); continue; }
          }

          const line = norm(tds.map(td => td.innerText || td.textContent || '').join(' '));
          const m = line.match(ROLE_INLINE);
          if (m) { pushMany(out, m[1], m[2]); continue; }
        }
      }

      // 2) DL
      if (!out.length) {
        for (const dt of root.querySelectorAll('dt')) {
          const a  = cleanRole(norm(dt.textContent));
          const dd = dt.nextElementSibling;
          const b  = norm(dd?.textContent || '');
          if (ROLE.test(a) && b) pushMany(out, a, b);
        }
      }

      // 3) GRID
      if (!out.length) {
        const nodes = Array.from(root.querySelectorAll('*')).filter(visible);
        for (let i=0;i<nodes.length;i++){
          const t = cleanRole(norm(nodes[i].textContent));
          if (!ROLE.test(t)) continue;
          let j=i+1;
          while (j<nodes.length){
            const v = norm(nodes[j].textContent || '');
            if (!v) { j++; continue; }
            if (ROLE.test(cleanRole(v))) break;
            pushMany(out, t, v);
            break;
          }
        }
      }

      // 4) fallback linhas
      if (!out.length) {
        for (const el of root.querySelectorAll('p,div,li,span')) {
          const t = norm(el.innerText || el.textContent || '');
          const m = t.match(ROLE_INLINE);
          if (m) pushMany(out, m[1], m[2]);
        }
      }

      const seen = new Set();
      return out.filter(p => {
        const k = (p.role||'').toLowerCase() + '|' + (p.nome||'').toLowerCase() + '|' + (p.doc||'');
        if (seen.has(k)) return false; seen.add(k); return true;
      }).slice(0,150);
    });
  }

  const scopes = [page, ...page.frames()];
  let all = [];
  for (const scope of scopes) {
    try { await expandPartesIn(scope); } catch {}
    try {
      const arr = await runIn(scope);
      all = all.concat(arr||[]);
    } catch {}
  }

  const ded = new Map();
  for (const p of all) {
    const k = `${p.role}|${p.nome}|${p.doc||''}`.toLowerCase();
    if (!ded.has(k)) ded.set(k, p);
  }
  const final = Array.from(ded.values());

  if (!final.length) {
    try {
      await fs.writeFile('partes_fail.html', await page.content(), 'utf8');
      let idx=0; for (const f of page.frames()) {
        await fs.writeFile(`partes_fail_frame${idx++}.html`, await f.content(), 'utf8');
      }
      await page.screenshot({ path:'partes_fail.png', fullPage:true });
      console.warn('[PARTES] Nada extraído — salvei partes_fail.html/png');
    } catch {}
  }
  return final;
}
// ==================== Seções "como Movimentações" ====================

// ---- PETIÇÕES ----
async function expandAllPetitions(page) {
  const st = await getSectionStatusLoose(page, /peti(?:ç|c)[oõ]es/i);
  if (!st.root) return;
  await expandAllInside(st.scope, st.root);
}
async function getPetitionsSectionStatus(page) {
  return await getSectionStatusLoose(page, /peti(?:ç|c)[oõ]es/i);
}
async function getPetitionsContainerHTML(page) {
  return await getSectionHTMLLike(page, /peti(?:ç|c)[oõ]es/i);
}
async function extractPetitionsOnCurrentPage(page) {
  const st = await getSectionStatusLoose(page, /peti(?:ç|c)[oõ]es/i);
  if (!st.root) return [];
  const rows = await st.root.evaluate((sec) => {
    const norm = (s)=> (s||'').replace(/\s+/g,' ').trim();
    const DATE = /\b\d{2}\/\d{2}\/\d{4}\b/;
    const out = [];
    for (const tr of sec.querySelectorAll('table tr')) {
      const cols = Array.from(tr.querySelectorAll('th,td')).map(td=>norm(td.innerText||td.textContent||''));
      if (!cols.length) continue;
      const joined = cols.join(' | ');
      const data = (joined.match(DATE)||[])[0]||null;
      const tipo = cols.find(c=>!DATE.test(c)) || joined;
      if (data || tipo) out.push({ data, tipo, texto: joined });
    }
    if (!out.length) {
      for (const el of sec.querySelectorAll('li,p,div')) {
        const t = norm(el.innerText||el.textContent||'');
        if (!t) continue;
        const m = t.match(DATE);
        if (m) out.push({ data: m[0], tipo: t.replace(m[0],'').replace(/^\s*[-–—:\s]+/,'').trim()||t, texto: t });
      }
    }
    return out.slice(0,400);
  });
  return rows.map(r => ({
    filed_at: r.data ? toISOFromBR(r.data) : null,
    type: (r.tipo||'').replace(/\bmovimenta\w*/i,'').trim(),
    texto: r.texto || r.tipo || ''
  })).filter(r => r.type);
}

// ---- INCIDENTES/RECURSOS/EXECUÇÃO ----
async function expandAllIncidents(page) {
  const st = await getSectionStatusLoose(page, /(incidentes?|a[cç][oõ]es?\s+incidentais|recursos?|execu(?:ç|c)[aã]o(?:es)?\s+de?\s+senten[cç]a)/i);
  if (!st.root) return;
  await expandAllInside(st.scope, st.root);
}
async function getIncidentsSectionStatus(page) {
  return await getSectionStatusLoose(page, /(incidentes?|a[cç][oõ]es?\s+incidentais|recursos?|execu(?:ç|c)[aã]o(?:es)?\s+de?\s+senten[cç]a)/i);
}
async function getIncidentsContainerHTML(page) {
  return await getSectionHTMLLike(page, /(incidentes?|a[cç][oõ]es?\s+incidentais|recursos?|execu(?:ç|c)[aã]o(?:es)?\s+de?\s+senten[cç]a)/i);
}
async function extractIncidentsOnCurrentPage(page) {
  const st = await getSectionStatusLoose(page, /(incidentes?|a[cç][oõ]es?\s+incidentais|recursos?|execu(?:ç|c)[aã]o(?:es)?\s+de?\s+senten[cç]a)/i);
  if (!st.root) return [];
  const TYPE = /(apelaç|agravo|embarg|recurso|incidente|conflito|execu(?:ç|c)[aã]o)/i;
  const rows = await st.root.evaluate((sec, TYPE_SRC) => {
    const TYPE = new RegExp(TYPE_SRC, 'i');
    const norm = (s)=> (s||'').replace(/\s+/g,' ').trim();
    const DATE = /\b\d{2}\/\d{2}\/\d{4}\b/;
    const CNJ  = /\b\d{7}-\d{2}\.\d{4}\.\d\.\d{2}\.\d{4}\b/g;
    const out = [];
    const push = (t) => {
      if (!t) return;
      const filed_at = (t.match(DATE)||[])[0]||null;
      const cnjs = t.match(CNJ) || [];
      const type = (TYPE.test(t) ? (t.match(TYPE)||[])[0] : null);
      out.push({ texto: norm(t), filed_at, cnjs, type });
    };
    for (const tr of sec.querySelectorAll('table tr')) {
      const t = norm(Array.from(tr.querySelectorAll('th,td')).map(td=>td.innerText||td.textContent||'').join(' '));
      push(t);
    }
    for (const el of sec.querySelectorAll('li,p,div')) {
      const t = norm(el.innerText||el.textContent||'');
      push(t);
    }
    return out.filter(x => !(/movimenta/i.test(x.texto))).slice(0,400);
  }, TYPE.source);
  return rows.map(r => ({
    text: r.texto,
    related_cnjs: r.cnjs || [],
    filed_at: r.filed_at ? toISOFromBR(r.filed_at) : null,
    type: r.type || null
  })).filter(r => r.text);
}

// ---- APENSOS/ENTRANHADOS/UNIFICADOS ----
async function expandAllApensos(page) {
  const st = await getSectionStatusLoose(page, /(apensos?|entranhad[oa]s?|unificad[oa]s?)/i);
  if (!st.root) return;
  await expandAllInside(st.scope, st.root);
}
async function getApensosSectionStatus(page) {
  return await getSectionStatusLoose(page, /(apensos?|entranhad[oa]s?|unificad[oa]s?)/i);
}
async function getApensosContainerHTML(page) {
  return await getSectionHTMLLike(page, /(apensos?|entranhad[oa]s?|unificad[oa]s?)/i);
}
async function extractApensosOnCurrentPage(page) {
  // trabalha igual às Movimentações: acha o container pelo título e extrai só dali
  const items = await page.evaluate(async () => {
    const norm  = (s)=> (s||'').replace(/\s+/g,' ').trim();
    const CNJrx = /\b\d{7}-\d{2}\.\d{4}\.\d\.\d{2}\.\d{4}\b/g;
    const DATE  = /\b\d{2}\/\d{2}\/\d{4}\b/;
    const headerRx = /(apensos?|entranhad[oa]s?|unificad[oa]s?)/i;

    function findApensosContainer() {
      const titles = Array.from(document.querySelectorAll('h1,h2,h3,h4,legend,strong,div,span'))
        .filter(el => headerRx.test(norm(el.textContent||'')));
      if (!titles.length) return document;
      let best = titles[0].closest('section,fieldset,article,div') || document;
      let bestScore = -1;
      for (const t of titles) {
        const sec = t.closest('section,fieldset,article,div') || t.parentElement || document;
        const score = sec.querySelectorAll('tr,td,th,li,p,div,span').length;
        if (score > bestScore) { best = sec; bestScore = score; }
      }
      return best;
    }

    const sec = findApensosContainer();
    const out = [];

    // 1) Tabelas com ou sem cabeçalho reconhecível
    for (const table of Array.from(sec.querySelectorAll('table'))) {
      const headers = Array.from(table.querySelectorAll('thead th, tr th')).map(th => norm(th.textContent || ''));
      const colsMap = {
        numero: headers.findIndex(h => /(n[úu]mero|processo|cnj)/i.test(h)),
        classe: headers.findIndex(h => /classe/i.test(h)),
        motivo: headers.findIndex(h => /motivo/i.test(h)),
        data:   headers.findIndex(h => /data/i.test(h)),
      };
      for (const tr of Array.from(table.querySelectorAll('tbody tr, tr'))) {
        const tds = Array.from(tr.querySelectorAll('td,th')).map(td => norm(td.innerText || td.textContent || ''));
        if (!tds.length) continue;

        // com cabeçalho mapeado
        let numero = null, classe = null, motivo = null, data = null, texto = null;
        if (headers.length >= 2 && (colsMap.numero>=0 || colsMap.classe>=0 || colsMap.motivo>=0 || colsMap.data>=0)) {
          if (colsMap.numero >= 0 && tds[colsMap.numero]) numero = (tds[colsMap.numero].match(CNJrx) || [null])[0];
          if (colsMap.classe >= 0 && tds[colsMap.classe]) classe = tds[colsMap.classe];
          if (colsMap.motivo >= 0 && tds[colsMap.motivo]) motivo = tds[colsMap.motivo];
          if (colsMap.data   >= 0 && tds[colsMap.data])   data   = (tds[colsMap.data].match(DATE)||[])[0] || null;
          texto = tds.join(' | ');
        } else {
          // sem cabeçalho: junta e extrai por regex
          texto  = tds.join(' | ');
          numero = (texto.match(CNJrx) || [null])[0];
          const dataMatch = texto.match(DATE);
          data   = dataMatch ? dataMatch[0] : null;
          // tenta classe a partir de "Classe: X" ou tokens comuns
          classe = (texto.match(/classe\s*:\s*([^|]+)/i)?.[1] || '') ||
                   (texto.match(/\b(Execu\w+|Apela\w+|Agravo\w+|Embarg\w+|C[ií]vel|Crim\w+|Juizad\w+)/i)?.[0] || '') ||
                   null;
          motivo = (texto.match(/motivo\s*:\s*([^|]+)/i)?.[1] || '') || null;
        }
        if (numero || texto) out.push({ numero, classe, motivo, apensado_em: data, texto });
      }
    }

    // 2) Fallback: listas / cards / divs
    if (!out.length) {
      const blocks = Array.from(sec.querySelectorAll('li, .card, .panel, div, p'))
        .filter(el => el.offsetParent !== null);
      for (const el of blocks) {
        const t = norm(el.innerText || el.textContent || '');
        if (!t) continue;
        const cnjs = t.match(CNJrx) || [];
        const data = (t.match(DATE)||[])[0] || null;
        const classe = (t.match(/classe\s*:\s*([^|]+)/i)?.[1] || '') ||
                       (t.match(/\b(Execu\w+|Apela\w+|Agravo\w+|Embarg\w+|C[ií]vel|Crim\w+|Juizad\w+)/i)?.[0] || '') ||
                       null;
        const motivo = (t.match(/motivo\s*:\s*([^|]+)/i)?.[1] || '') || null;
        if (cnjs.length || /apens/i.test(t)) {
          out.push({ numero: cnjs[0] || null, classe, motivo, apensado_em: data, texto: t });
        }
      }
    }
    return out;
  });

  // normaliza como fazemos em Movimentações (dedupe + campos finais)
  const seen = new Set();
  return items
    .map(x => ({
      numero: x.numero || null,
      classe: sanitizeClasse(x.classe || null),
      apensado_em: x.apensado_em || null,
      motivo: x.motivo || null,
      text: (x.texto || '').trim() || [x.numero, x.classe, x.motivo, x.apensado_em].filter(Boolean).join(' | '),
      related_cnjs: (x.numero ? [x.numero] : [])
    }))
    .filter(r => r.text) // text é a chave única no seu schema
    .filter(r => { const k = r.text.toLowerCase(); if (seen.has(k)) return false; seen.add(k); return true; });
}


// ---- AUDIÊNCIAS ----
async function expandAllHearings(page) {
  const st = await getSectionStatusLoose(page, /(audi[eê]ncias?|sess[oõ]es?)/i);
  if (!st.root) return;
  await expandAllInside(st.scope, st.root);
}
async function getHearingsSectionStatus(page) {
  return await getSectionStatusLoose(page, /(audi[eê]ncias?|sess[oõ]es?)/i);
}
async function getHearingsContainerHTML(page) {
  return await getSectionHTMLLike(page, /(audi[eê]ncias?|sess[oõ]es?)/i);
}
async function extractHearingsOnCurrentPage(page) {
  const st = await getSectionStatusLoose(page, /(audi[eê]ncias?|sess[oõ]es?)/i);
  if (!st.root) return [];
  const rows = await st.root.evaluate((sec) => {
    const norm = (s)=> (s||'').replace(/\s+/g,' ').trim();
    const DATE = /\b\d{2}\/\d{2}\/\d{4}\b/;
    const TIME = /\b\d{2}:\d{2}\b/;
    const out = [];
    for (const tr of sec.querySelectorAll('table tr')) {
      const cols = Array.from(tr.querySelectorAll('th,td')).map(td=>norm(td.innerText||td.textContent||''));
      if (!cols.length) continue;
      const joined = cols.join(' | ');
      const data = (joined.match(DATE)||[])[0]||null;
      const hora = (joined.match(TIME)||[])[0]||null;
      const tipo = cols.find(c=>!DATE.test(c) && !TIME.test(c)) || null;
      out.push({ data, hora, tipo, descricao: joined, local: null });
    }
    if (!out.length) {
      for (const el of sec.querySelectorAll('li,p,div')) {
        const t = norm(el.innerText||el.textContent||'');
        if (!t) continue;
        const data = (t.match(DATE)||[])[0]||null;
        const hora = (t.match(TIME)||[])[0]||null;
        out.push({ data, hora, tipo: null, descricao: t, local: null });
      }
    }
    return out.slice(0,400);
  });
  return rows.map(a => {
    const dateISO = a.data ? toISOFromBR(a.data) : null;
    const scheduled_at = (dateISO && a.hora) ? `${dateISO}T${a.hora}:00` : null;
    return {
      scheduled_at,
      date_only: dateISO,
      time_txt: a.hora || null,
      description: String(a.descricao || a.tipo || '').replace(/\s+/g,' ').trim(),
      tipo: a.tipo || null,
      local: a.local || null
    };
  }).filter(r => r.description || r.tipo);
}

// ==================== Movimentações (inalterado) ====================
async function goToCNJ(page, cnj) {
  const sleep = (ms) => new Promise(r => setTimeout(r, ms));
  const d = String(cnj).replace(/\D+/g, '');
  if (d.length !== 20) return { ok: false, reason: 'invalid_cnj', message: 'CNJ precisa ter 20 dígitos' };
  const cnjMask = `${d.slice(0,7)}-${d.slice(7,9)}.${d.slice(9,13)}.${d.slice(13,14)}.${d.slice(14,16)}.${d.slice(16,20)}`;
  const foro = d.slice(16,20);

  await page.goto('https://esaj.tjsp.jus.br/cpopg/open.do', { waitUntil: 'domcontentloaded' });
  await sleep(900);

  try {
    const tipoLbl = page.locator('label, span, div').filter({ hasText: /n[úu]mero.*processo/i }).first();
    if (await tipoLbl.isVisible()) {
      await tipoLbl.click({ delay: 60 });
      await sleep(600);
    }
  } catch {}

  const singleSel = 'input#numeroDigitoAnoUnificado, input[name="numeroDigitoAnoUnificado"], input#numeroProcesso, input[name="numeroProcesso"]';
  const single = page.locator(singleSel).first();
  if (await single.isVisible().catch(() => false)) {
    await single.click({ clickCount: 3, delay: 40 }).catch(() => {});
    await sleep(300);
    await page.fill(singleSel, '').catch(() => {});
    await sleep(200);
    await page.type(singleSel, cnjMask, { delay: 110 }).catch(() => {});

    const foroSel = 'input#foroNumeroUnificado, input[name="foroNumeroUnificado"], input[name="foro"]';
    const foroInput = page.locator(foroSel).first();
    if (await foroInput.isVisible().catch(() => false)) {
      await foroInput.click({ clickCount: 3, delay: 40 }).catch(() => {});
      await sleep(220);
      await page.fill(foroSel, '').catch(() => {});
      await sleep(180);
      await page.type(foroSel, foro, { delay: 120 }).catch(() => {});
    }
  } else {
    await page.fill('input[name="numero"]', `${d.slice(0,7)}-${d.slice(7,9)}`).catch(() => {});
    await sleep(200);
    await page.fill('input[name="ano"]', d.slice(9,13)).catch(() => {});
    await sleep(200);
    await page.fill('input[name="orgao"]', d.slice(13,14)).catch(() => {});
    await sleep(200);
    await page.fill('input[name="tribunal"]', d.slice(14,16)).catch(() => {});
    await sleep(200);
    await page.fill('input[name="foro"]', foro).catch(() => {});
  }
  await sleep(850);

  const clickSearch = async () => {
    const searchBtn = page.getByRole('button', { name: /pesquisar|consultar|buscar/i }).first();
    if (await searchBtn.isVisible().catch(() => false)) {
      await sleep(450);
      await Promise.all([
        page.waitForLoadState('domcontentloaded').catch(() => {}),
        searchBtn.click({ delay: 70 }).catch(() => {})
      ]);
      await page.waitForLoadState('networkidle').catch(() => {});
      return true;
    }
    const submit = page.locator('input[type="submit"]').filter({ hasText: /pesquisar|consultar|buscar/i }).first();
    if (await submit.isVisible().catch(() => false)) {
      await sleep(450);
      await Promise.all([
        page.waitForLoadState('domcontentloaded').catch(() => {}),
        submit.click({ delay: 70 }).catch(() => {})
      ]);
      await page.waitForLoadState('networkidle').catch(() => {});
      return true;
    }
    await sleep(450);
    await page.keyboard.press('Enter').catch(() => {});
    await page.waitForLoadState('domcontentloaded').catch(() => {});
    await page.waitForLoadState('networkidle').catch(() => {});
    return true;
  };
  await clickSearch();

  const listRow = page.locator('tr, li, div').filter({ hasText: cnjMask }).first();
  if (await listRow.isVisible().catch(() => false)) {
    const detailLink = listRow.locator('a[href*="cpopg/"]').filter({ hasText: /detalhe|visualizar|ver|processo|movimenta/i }).first();
    if (await detailLink.isVisible().catch(() => false)) {
      const txt = (await detailLink.innerText().catch(() => '')) || '';
      if (!/auto(s)?/i.test(txt)) {
        await Promise.all([
          page.waitForNavigation({ waitUntil: 'domcontentloaded' }).catch(() => {}),
          detailLink.click({ delay: 70 }).catch(() => {})
        ]);
      }
    } else {
      const show = listRow.locator('a[href*="cpopg/show.do"]').first();
      if (await show.isVisible().catch(() => false)) {
        await Promise.all([
          page.waitForNavigation({ waitUntil: 'domcontentloaded' }).catch(() => {}),
          show.click({ delay: 70 }).catch(() => {})
        ]);
      }
    }
  } else {
    const linkByCNJ = page.locator('a[href*="cpopg/"]').filter({ hasText: cnjMask }).first();
    if (await linkByCNJ.isVisible().catch(() => false)) {
      const txt = (await linkByCNJ.innerText().catch(() => '')) || '';
      if (!/auto(s)?/i.test(txt)) {
        await Promise.all([
          page.waitForNavigation({ waitUntil: 'domcontentloaded' }).catch(() => {}),
          linkByCNJ.click({ delay: 70 }).catch(() => {})
        ]);
      }
    }
  }

  try {
    const tabMov = page.getByRole('tab', { name: /movimenta/i }).first();
    if (await tabMov.isVisible()) {
      await sleep(350);
      await tabMov.click({ delay: 60 }).catch(() => {});
      await page.waitForLoadState('networkidle').catch(() => {});
    }
  } catch {}

  const url = page.url();
  const isDetail = /cpopg\/show\.do/i.test(url);
  const dataCount = await page.locator('.dataMovimentacao, .data-movimentacao').count();
  const hasMovSection = await page.getByText(/movimenta/i, { exact: false }).count();
  if (isDetail || dataCount > 0 || hasMovSection > 0) return { ok: true };

  const msg = await page.evaluate(() => {
    const sels = [
      '.msg', '.message', '.messages', '.alert', '.aviso', '.erro', '.error',
      '.ui-message-error', '.ui-messages-error', '.notice', '.warn', '.warning'
    ];
    const texts = [];
    for (const s of sels) {
      for (const el of document.querySelectorAll(s)) {
        const t = (el.innerText || el.textContent || '').trim();
        if (t) texts.push(t);
      }
    }
    return texts.join(' | ');
  });
  if (/inv[aá]lid/i.test(msg) || /selecione/i.test(msg) || /obrigat[óo]rio/i.test(msg)) {
    return { ok: false, reason: 'validation', message: msg || 'Validação falhou' };
  }
  return { ok: false, reason: 'unknown', message: 'Não cheguei na tela esperada de detalhes/movimentações.' };
}

async function expandAllMovements(page) {
  const tryRole = async (rx) => {
    try {
      const btn = page.getByRole('button', { name: rx }).first();
      if (await btn.isVisible()) {
        await btn.scrollIntoViewIfNeeded();
        await Promise.all([
          page.waitForLoadState('networkidle').catch(() => {}),
          btn.click().catch(() => {})
        ]);
        await page.waitForTimeout(800);
        return true;
      }
    } catch {}
    return false;
  };
  const tryGeneric = async (rx) => {
    const loc = page.locator('a, button').filter({ hasText: rx });
    const n = await loc.count();
    for (let i = 0; i < n; i++) {
      const el = loc.nth(i);
      if (await el.isVisible()) {
        await el.scrollIntoViewIfNeeded();
        await Promise.all([
          page.waitForLoadState('networkidle').catch(() => {}),
          el.click().catch(() => {})
        ]);
        await page.waitForTimeout(800);
        return true;
      }
    }
    return false;
  };
  const patterns = [
    /exibir.*movimenta/i, /exibir.*todas/i, /visualizar.*movimenta/i, /visualizar.*todas/i,
    /ver.*todas.*movimenta/i, /ver mais.*movimenta/i, /todas as movimenta/i, /mais movimenta/i, /ver mais/i
  ];
  for (let round = 0; round < 6; round++) {
    let clicked = false;
    for (const rx of patterns) {
      if (await tryRole(rx)) { clicked = true; break; }
      if (await tryGeneric(rx)) { clicked = true; break; }
    }
    if (!clicked) break;
  }
  for (let i = 0; i < 4; i++) {
    await page.mouse.wheel(0, 2000);
    await page.waitForTimeout(400);
  }
}

async function getMovementsContainerHTML(page) {
  if (!USE_RAW_HTML) return null;
  try {
    const handle = await sliceSectionByHeader(page, /movimenta/i);
    if (!handle) return await page.content();
    return await handle.evaluate(node => node.outerHTML);
  } catch { return null; }
}
async function getMovementsSectionStatus(page) {
  const scopes = [page, ...page.frames()];
  for (const sc of scopes) {
    try {
      const h = await sliceSectionByHeader(sc, /movimenta/i);
      if (!h) continue;
      const { empty, html } = await h.evaluate((root) => {
        const norm = (s) => (s||'').replace(/\s+/g,' ').trim();
        const txt = norm(root.textContent||'');
        const empty = /(não\s+h[aá]\s+dados|nao\s+ha\s+dados|sem\s+registros|sem\s+registro|nenhum\s+dado|nenhuma\s+informa[cç][aã]o|nenhum\s+resultado)/i.test(txt);
        return { empty, html: root.outerHTML };
      });
      return { exists: true, empty, raw_html: USE_RAW_HTML ? html : null };
    } catch {}
  }
  return { exists: false, empty: false, raw_html: null };
}

async function extractMovementsOnCurrentPage(page) {
  const items = await page.evaluate(() => {
    const isDateBR = (s) => /\b\d{2}\/\d{2}\/\d{4}\b/.test(s || '');
    const findMovContainer = () => {
      const candidates = Array.from(document.querySelectorAll('h1,h2,h3,h4,legend,strong,div,span'))
        .filter(el => /movimenta/i.test((el.textContent || '').trim()));
      if (!candidates.length) return document;
      for (const el of candidates) {
        const sec =
          el.closest('section,fieldset,article,div') ||
          el.parentElement ||
          document;
        const density = sec.querySelectorAll('tr,li,div,td,span').length;
        if (density > 30) return sec;
      }
      return candidates[0].closest('section,fieldset,article,div') || document;
    };
    const container = findMovContainer();
    const out = [];

    const dates = container.querySelectorAll('.dataMovimentacao, .data-movimentacao');
    if (dates.length) {
      for (const dt of dates) {
        const dateBR = (dt.textContent || '').trim();
        let desc = '';
        const parent = dt.closest('tr, li, div') || dt.parentElement;
        if (parent) {
          const d1 = parent.querySelector('.descricaoMovimentacao, .descricao-movimentacao');
          if (d1) desc = (d1.textContent || '').trim();
        }
        if (!desc) {
          let el = dt;
          for (let i = 0; i < 5 && el; i++) {
            el = el.nextElementSibling;
            if (el && (el.textContent || '').trim().length > 5) {
              desc = el.textContent.trim();
              break;
            }
          }
        }
        if (isDateBR(dateBR) && desc) out.push({ dateBR, description: desc });
      }
      return out;
    }

    const tables = Array.from(container.querySelectorAll('table'));
    for (const table of tables) {
      for (const tr of Array.from(table.querySelectorAll('tr'))) {
        const tds = Array.from(tr.querySelectorAll('td,th'));
        if (tds.length < 2) continue;
        const c0 = (tds[0].innerText || '').trim();
        const c1 = (tds[1].innerText || '').trim();
        if (isDateBR(c0) && c1) out.push({ dateBR: c0, description: c1 });
      }
    }
    if (out.length) return out;

    const nodes = container.querySelectorAll('ul li, .timeline li, .linhaTempo li, .movimentacao, .andamento, div');
    for (const li of nodes) {
      const text = (li.textContent || '').replace(/\s+/g, ' ').trim();
      const m = text.match(/(\d{2}\/\d{2}\/\d{4})\s*[-–—:]\s*(.+)/);
      if (m) out.push({ dateBR: m[1], description: m[2] });
    }
    return out;
  });

  const normalized = items
    .map(r => ({ moved_at: toISOFromBR(r.dateBR), description: r.description }))
    .filter(r => r.moved_at && r.description);

  if (!normalized.length) {
    try {
      await fs.writeFile('scrape_one.html', await page.content(), 'utf8');
      await page.screenshot({ path: 'scrape_one.png', fullPage: true });
      console.warn('Nenhuma movimentação encontrada. Salvei scrape_one.html e scrape_one.png para análise.');
    } catch {}
  }
  return normalized;
}

// ==================== Persistência ====================
async function upsertProcessDetails(cnj, header) {
  const payload = { cnj, last_detail_at: new Date().toISOString() };
  for (const k of ['classe','assunto','foro','vara','juiz','distribution_at','control_code','area','valor_acao']) {
    if (header[k] !== undefined && header[k] !== null && header[k] !== '') payload[k] = header[k];
  }
  const { error } = await supabase.from('processes').upsert(payload, { onConflict: 'cnj' });
  if (error) throw new Error('upsert details: ' + error.message);
}
async function saveParties(cnj, partes) {
  if (!Array.isArray(partes) || !partes.length) {
    console.log(`[PARTES] Nada a salvar para ${cnj} — mantendo dados anteriores.`);
    return { saved: 0 };
  }
  const dedup = new Map();
  for (const p of partes) {
    const role = p.role || p.papel || p.funcao || "Parte";
    const name = p.nome || p.name;
    const document = p.doc || p.document || null;
    if (!role || !name) continue;
    const k = `${role}|${name}|${document||""}`.toLowerCase();
    if (!dedup.has(k)) dedup.set(k, { process_cnj: cnj, role, name, document });
  }
  const rows = Array.from(dedup.values());
  const { error } = await supabase
    .from('process_parties')
    .upsert(rows, { onConflict: 'process_cnj,role,name', ignoreDuplicates: false });
  if (error) throw new Error('upsert parties: ' + error.message);
  console.log(`[PARTES] Upsert de ${rows.length} linha(s) para ${cnj}.`);
  return { saved: rows.length };
}

async function saveSectionsLikeMov(cnj, page, sourceURL) {
  // PETIÇÕES
  await expandAllPetitions(page);
  const stPet = await getPetitionsSectionStatus(page);
  let peticoes = await extractPetitionsOnCurrentPage(page);
  let petSaved = 0;
  if (Array.isArray(peticoes) && peticoes.length) {
    const seen = new Set();
    const rows = [];
    for (const p of peticoes) {
      const filed_at = p.filed_at || null;
      const type = String(p.type || '').trim();
      if (!type) continue;
      const key = `${filed_at || 'null'}|${type.toLowerCase()}`;
      if (seen.has(key)) continue; seen.add(key);
      rows.push({ process_cnj: cnj, filed_at, type, source_url: sourceURL, raw_html: stPet.raw_html });
    }
    if (rows.length) {
      const { error } = await supabase
        .from('process_petitions')
        .upsert(rows, { onConflict: 'process_cnj,filed_at,type', ignoreDuplicates: true });
      if (error) throw new Error('upsert petitions: ' + error.message);
      petSaved = rows.length;
    }
  }
  if (stPet.exists && (stPet.empty || petSaved === 0)) {
    const sent = [{ process_cnj: cnj, filed_at: SENTINEL_DATE, type: 'SEM REGISTROS', source_url: sourceURL, raw_html: stPet.raw_html }];
    const { error } = await supabase
      .from('process_petitions')
      .upsert(sent, { onConflict: 'process_cnj,filed_at,type', ignoreDuplicates: true });
    if (error) throw new Error('upsert petitions sentinel: ' + error.message);
  }

  // INCIDENTES
  await expandAllIncidents(page);
  const stInc = await getIncidentsSectionStatus(page);
  let incidentes = await extractIncidentsOnCurrentPage(page);
  let incSaved = 0;
  if (Array.isArray(incidentes) && incidentes.length) {
    const seen = new Set();
    const rows = [];
    for (const i of incidentes) {
      const text = String(i.text || '').replace(/\s+/g, ' ').trim();
      if (!text) continue;
      const cnjs = i.related_cnjs || [];
      const filed_at = i.filed_at || null;
      const type = i.type || null;
      const key = `${(type||'').toLowerCase()}|${(filed_at||'')}|${text.toLowerCase()}`;
      if (seen.has(key)) continue; seen.add(key);
      rows.push({ process_cnj: cnj, text, related_cnjs: cnjs, filed_at, type, source_url: sourceURL, raw_html: stInc.raw_html });
    }
    if (rows.length) {
      const { error } = await supabase.from('process_incidents').upsert(rows, {
        onConflict: 'process_cnj,text',
        ignoreDuplicates: true
      });
      if (error) throw new Error('upsert incidents: ' + error.message);
      incSaved = rows.length;
    }
  }
  if (stInc.exists && (stInc.empty || incSaved === 0)) {
    const sent = [{ process_cnj: cnj, text: 'SEM REGISTROS', related_cnjs: [], filed_at: null, type: null, source_url: sourceURL, raw_html: stInc.raw_html }];
    const { error } = await supabase.from('process_incidents').upsert(sent, {
      onConflict: 'process_cnj,text',
      ignoreDuplicates: true
    });
    if (error) throw new Error('upsert incidents sentinel: ' + error.message);
  }

// APENSOS
await expandAllApensos(page);
const stAps = await getApensosSectionStatus(page);
let apensos = await extractApensosOnCurrentPage(page);
if (stAps.exists && apensos.length === 0) {
  try { await fs.writeFile('apensos_fail.html', await getApensosContainerHTML(page) || await page.content(), 'utf8'); } catch {}
}

let apsSaved = 0;

if (Array.isArray(apensos) && apensos.length) {
  const seen = new Set();
  const rows = [];

  for (const a of apensos) {
    const numero       = a.numero || null;
    const classe       = (a.classe || '').trim() || null;
    const apensado_em  = a.apensado_em ? toISOFromBR(a.apensado_em) : null;
    const motivo       = (a.motivo || '').trim() || null;

    // texto bruto vindo do parser
    const textRaw = (a.text || a.texto || '').trim();
    // se faltar, montamos um texto para atender NOT NULL + UNIQUE(process_cnj,text)
    const text = textRaw || [numero, classe, motivo, apensado_em].filter(Boolean).join(' | ');
    if (!text) continue; // sem texto, não insere

    const key = text.toLowerCase();
    if (seen.has(key)) continue; seen.add(key);

    rows.push({
      process_cnj: cnj,
      numero, classe, apensado_em, motivo,
      text,
      related_cnjs: Array.isArray(a.related_cnjs) ? a.related_cnjs : (numero ? [numero] : []),
      source_url: sourceURL,
      raw_html: stAps.raw_html
    });
  }

  if (rows.length) {
    const { error } = await supabase.from('process_apensos').upsert(rows, {
      onConflict: 'process_cnj,text',
      ignoreDuplicates: true
    });
    if (error) throw new Error('upsert apensos: ' + error.message);
    apsSaved = rows.length;
  }
}

if (stAps.exists && (stAps.empty || apsSaved === 0)) {
  const sent = [{
    process_cnj: cnj,
    numero: null,
    classe: null,
    apensado_em: null,
    motivo: null,
    text: 'SEM REGISTROS',              // importante: NOT NULL e bate na UNIQUE
    related_cnjs: [],
    source_url: sourceURL,
    raw_html: stAps.raw_html
  }];
  const { error } = await supabase.from('process_apensos').upsert(sent, {
    onConflict: 'process_cnj,text',
    ignoreDuplicates: true
  });
  if (error) throw new Error('upsert apensos sentinel: ' + error.message);
}


  // AUDIÊNCIAS
  await expandAllHearings(page);
  const stAud = await getHearingsSectionStatus(page);
  let audiencias = await extractHearingsOnCurrentPage(page);
  let audSaved = 0;
  if (Array.isArray(audiencias) && audiencias.length) {
    const seen = new Set();
    const rows = [];
    for (const a of audiencias) {
      const { scheduled_at, date_only, time_txt, description, tipo, local } = a;
      if (!description && !tipo) continue;
      const key = `${scheduled_at || date_only || 'null'}|${(tipo||'')}|${(description||'').toLowerCase()}`;
      if (seen.has(key)) continue; seen.add(key);
      rows.push({ process_cnj: cnj, scheduled_at, date_only, time_txt, description, tipo, local, source_url: sourceURL, raw_html: stAud.raw_html });
    }
    if (rows.length) {
      let res = await supabase.from('process_hearings').upsert(rows, {
        onConflict: 'process_cnj,scheduled_at,description',
        ignoreDuplicates: true
      });
      if (res.error && /local/.test(res.error.message || '')) {
        const rows2 = rows.map(({ local, ...rest }) => rest);
        res = await supabase.from('process_hearings').upsert(rows2, {
          onConflict: 'process_cnj,scheduled_at,description',
          ignoreDuplicates: true
        });
      }
      if (res.error) throw new Error('upsert hearings: ' + res.error.message);
      audSaved = rows.length;
    }
  }
  if (stAud.exists && (stAud.empty || audSaved === 0)) {
    const sent = [{ process_cnj: cnj, scheduled_at: `${SENTINEL_DATE}T00:00:00`, date_only: SENTINEL_DATE, time_txt: null, description: 'SEM REGISTROS', tipo: null, local: null, source_url: sourceURL, raw_html: stAud.raw_html }];
    let res = await supabase.from('process_hearings').upsert(sent, {
      onConflict: 'process_cnj,scheduled_at,description',
      ignoreDuplicates: true
    });
    if (res.error && /local/.test(res.error.message || '')) {
      const sent2 = sent.map(({ local, ...rest }) => rest);
      res = await supabase.from('process_hearings').upsert(sent2, {
        onConflict: 'process_cnj,scheduled_at,description',
        ignoreDuplicates: true
      });
    }
    if (res.error) throw new Error('upsert hearings sentinel: ' + res.error.message);
  }

  // Carimba last_detail_at e zera colunas legadas
  await supabase.from('processes')
    .upsert(
      { cnj, last_detail_at: new Date().toISOString(), peticoes: null, incidentes: null, apensos: null, audiencias: null },
      { onConflict: 'cnj' }
    );

  return { counts: { peticoes: petSaved, incidentes: incSaved, apensos: apsSaved, audiencias: audSaved } };
}

async function upsertProcessAndMovements(cnj, items) {
  if (!items?.length) return { inserted: 0 };
  const { error: e1 } = await supabase
    .from('processes')
    .upsert({ cnj, last_scraped_at: new Date().toISOString() }, { onConflict: 'cnj' });
  if (e1) throw new Error('upsert process: ' + e1.message);

  const rows = items.map(i => ({
    process_cnj: cnj,
    moved_at: i.moved_at,
    description: i.description,
    source_url: i.source_url || null,
    raw_html: i.raw_html || null,
    hash: sha1(`${cnj}|${i.moved_at}|${i.description}`)
  }));
  const { error: e2 } = await supabase
    .from('movements')
    .upsert(rows, { onConflict: 'process_cnj,hash', ignoreDuplicates: true });
  if (e2) throw new Error('upsert movements: ' + e2.message);
  return { inserted: rows.length };
}

// ==================== Main ====================
async function main() {
  const cnj = process.argv[2];
  if (!cnj) {
    console.error('Uso: node scripts/scrape_one.js 0000000-00.0000.0.00.0000');
    process.exit(1);
  }

  const STORAGE_STATE = process.env.PW_STORAGE_STATE || 'esaj-state.json';
  const PERSIST_SESSION = String(process.env.PW_PERSIST_SESSION||'').trim()==='1';
  const KEEP_OPEN = String(process.env.PW_KEEP_OPEN||'').trim()==='1';
  const USER_DATA_DIR = process.env.PW_USER_DATA_DIR || '.pw-esaj';

  const rl = readline.createInterface({ input, output });

  let context, browser, page;
  if (PERSIST_SESSION) {
    context = await chromium.launchPersistentContext(USER_DATA_DIR, { headless: HEADLESS, slowMo: SLOWMO });
    page = await context.newPage();
  } else {
    browser = await chromium.launch({ headless: HEADLESS, slowMo: SLOWMO });
    let statePath;
    try { await fs.access(STORAGE_STATE); statePath = STORAGE_STATE; } catch {}
    context = await browser.newContext({ storageState: statePath });
    page = await context.newPage();
  }

  await autoLoginESAJ(page, rl);
  try { await page.context().storageState({ path: STORAGE_STATE }); } catch {}

  const nav = await goToCNJ(page, cnj);
  if (!nav.ok) {
    console.error('[NAV] Falhou ao chegar no processo:', nav.reason, nav.message || '');
    try {
      await fs.writeFile('goToCNJ_fail.html', await page.content(), 'utf8');
      await page.screenshot({ path: 'goToCNJ_fail.png', fullPage: true });
      console.warn('Salvei goToCNJ_fail.html e goToCNJ_fail.png.');
    } catch {}
    await page.waitForTimeout(20000);
    await rl.close();
    if (browser?.close) await browser.close();
    if (context?.close) await context.close();
    process.exit(2);
  }

  // -------- Header
  await expandHeaderDetails(page);

  const headerBasic   = await extractHeaderBasic(page);
  const headerWide    = await extractCaseSummary(page);
  const headerSection = await extractHeaderFromSection(page);

  const header = {
    classe:        sanitizeClasse(headerSection.classe) 
                ?? sanitizeClasse(headerBasic.classe) 
                ?? sanitizeClasse(headerWide.classe) 
                ?? null,
    assunto:       headerSection.assunto       ?? headerBasic.assunto       ?? headerWide.assunto       ?? null,
    foro:          headerSection.foro          ?? headerBasic.foro          ?? headerWide.foro          ?? null,
    vara:          headerSection.vara          ?? headerBasic.vara          ?? headerWide.vara          ?? null,
    juiz:          headerSection.juiz          ?? headerBasic.juiz          ?? headerWide.juiz          ?? null,
    distribution_at: headerSection.distribution_at
                  ?? (headerBasic.distribuicao ? `${toISOFromBR(headerBasic.distribuicao)}T00:00:00` : null)
                  ?? headerWide.distribution_at
                  ?? null,
    control_code:  headerSection.control_code  ?? headerBasic.controle      ?? headerWide.control_code  ?? null,
    area:          headerSection.area          ?? headerBasic.area          ?? headerWide.area          ?? null,
    valor_acao:    headerSection.valor_acao    ?? toNumberBRL(headerBasic.valorAcao) ?? headerWide.valor_acao ?? null,
  };

  const allNull = Object.values(header).every(v => v === null || v === undefined || v === '');
  if (allNull) {
    try {
      await fs.writeFile('header_fail.html', await page.content(), 'utf8');
      await page.screenshot({ path: 'header_fail.png', fullPage: true });
      console.warn('[HEADER] Não extraí nada — salvei header_fail.html/png');
    } catch {}
  }
  await upsertProcessDetails(cnj, header);

  // -------- Partes
  await expandSectionByHeader(page, /(partes?|representantes|polo\s+ativo|polo\s+passivo)/i);
  const partes = await extractPartes(page);
  console.log(`[PARTES] Extraídas ${partes.length} linha(s).`);
  await saveParties(cnj, partes);
  console.log('[DETAILS] Resumo e Partes gravados.');

  // -------- Seções (estilo Movimentações)
  const { counts } = await saveSectionsLikeMov(cnj, page, page.url());
  console.log('[DETAILS] Seções gravadas (estilo Mov):', counts);

  // -------- Movimentações
  await expandAllMovements(page);
  const movStatus = await getMovementsSectionStatus(page);
  const items = await extractMovementsOnCurrentPage(page);
  console.log(`Extraídas ${items.length} movimentações.`);

  let rows = items.map(i => ({ ...i, source_url: page.url(), raw_html: movStatus.raw_html }));
  if ((!rows || rows.length === 0) && movStatus.exists) {
    rows = [{ moved_at: SENTINEL_DATE, description: 'SEM REGISTROS', source_url: page.url(), raw_html: movStatus.raw_html }];
  }
  const { inserted } = await upsertProcessAndMovements(cnj, rows);
  console.log(`Gravadas ${inserted} movimentações no Supabase para ${cnj}.`);

  await rl.close();
  if (KEEP_OPEN && context?.pages()?.length) {
    console.log('[INFO] PW_KEEP_OPEN=1 — mantendo sessão/abas abertas para testes. Pressione Ctrl+C para encerrar.');
    await new Promise(() => {});
  } else {
    try { await page.context().storageState({ path: STORAGE_STATE }); } catch {}
    if (context?.close) await context.close();
    if (browser?.close) await browser.close();
  }
}

main().catch(err => {
  console.error(err);
  process.exit(1);
});
