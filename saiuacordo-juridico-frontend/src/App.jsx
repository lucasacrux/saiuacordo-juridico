import React, { useEffect, useState } from "react";
import { IMaskInput } from "react-imask";
import {
  Loader2, LogIn, Search, FileText, RefreshCw, ShieldCheck,
  Bell, Upload, X
} from "lucide-react";

/** ======= MODOS DE EXECUÇÃO ======= */
const DEMO_APP = false;
const AUTO_LOGIN_DEMO = false;
// Consulta CPF/Contrato (API do CPF.html):
const DEMO_CPF = false; // deixe FALSE para usar dados reais de /api/pessoas

/** ======= ENDPOINTS (seu backend futuro) ======= */
const API_BASE = '/api';
const ENDPOINTS = {
  me: `${API_BASE}/auth/me`,
  login: `${API_BASE}/auth/login`,
  tjspConnect: `${API_BASE}/auth/tjsp/connect`,
  tjspOtp: `${API_BASE}/auth/tjsp/otp`,
  tjspPing: `${API_BASE}/auth/tjsp/ping`,
  tjspResend: `${API_BASE}/auth/tjsp/resend`, // opcional: se existir no backend
  tjspStatus: `${API_BASE}/auth/tjsp/status`, // opcional: se existir no backend
  search: `${API_BASE}/processes/search`,
  details: (cnj) => `${API_BASE}/processes/${encodeURIComponent(cnj)}/details`,
  movements: (cnj) => `${API_BASE}/processes/${encodeURIComponent(cnj)}/movements`,
  parties: (cnj) => `${API_BASE}/processes/${encodeURIComponent(cnj)}/parties`,
  importCNJ: `${API_BASE}/processes/import-csv`,
};

function normalizeParties(rows) {
  if (!Array.isArray(rows)) return [];
  const dedup = new Map(); // evita duplicados (chave: role|name|document)
  for (const r of rows) {
    const role = r.role || r.papel || r.funcao || "Parte";
    const nome = r.name || r.nome || "";
    const doc  = r.document || r.doc || null;
    if (!nome) continue;
    const key = [role, nome, doc || ""].join("|");
    if (!dedup.has(key)) dedup.set(key, { role, nome, doc });
  }
  return Array.from(dedup.values());
}

// --- Helpers p/ preview de "Partes" no grid ---
function classifySide(role = "") {
  const r = role.toLowerCase();
  if (/advog/.test(r)) return "adv";
  if (/(autor|autora|requerente|reqte|exequente|apelante|agravante|embargante|impetrante|reclamante)/.test(r)) return "ativo";
  if (/(réu|reu|requerido|reqdo|executado|apelado|agravado|embargado|impetrado|reclamado)/.test(r)) return "passivo";
  return "outro";
}

function makePartiesPreview(arr) {
  const parts = normalizeParties(arr).filter(p => !/advog/i.test(p.role || ""));
  if (!parts.length) return "";
  const ativos   = parts.filter(p => classifySide(p.role) === "ativo").map(p => p.nome).filter(Boolean);
  const passivos = parts.filter(p => classifySide(p.role) === "passivo").map(p => p.nome).filter(Boolean);

  const left  = ativos[0]   || parts[0]?.nome || "";
  const right = passivos[0] || (parts.find(p => p.nome && p.nome !== left)?.nome || "");
  let txt = [left, right].filter(Boolean).join(" x ");
  const extras = Math.max(0, parts.length - (right ? 2 : 1));
  if (extras > 0) txt += ` +${extras}`;
  return txt;
}

// cache simples p/ evitar refetch em navegação
const partiesPreviewCache = new Map();

async function fetchPartiesPreviewForCNJ(cnj) {
  if (partiesPreviewCache.has(cnj)) return partiesPreviewCache.get(cnj);
  try {
    const list = await apiGET(ENDPOINTS.parties(cnj));
    const prev = makePartiesPreview(list || []);
    partiesPreviewCache.set(cnj, prev);
    return prev;
  } catch {
    partiesPreviewCache.set(cnj, "");
    return "";
  }
}

// Enriquece as linhas do grid com o preview de Partes
// Busca as partes e monta um preview para o grid
async function enrichRowsWithPartiesPreviews(baseRows, setRows) {
  if (!Array.isArray(baseRows) || baseRows.length === 0) return;

  // utilitários de papel
  const isAdv  = (role = "") => /^advogad/i.test(role);
  const isLeft = (role = "") =>
    /(autor|requerente|exequente|embargante|agravante|apelante|impetrante|reclamante)/i.test(role);
  const isRight = (role = "") =>
    /(réu|reu|requerido|executado|embargado|agravado|apelado|impetrado|reclamado)/i.test(role);

  const toPreview = (parts = []) => {
    const arr = normalizeParties(parts).filter(p => !isAdv(p.role));
    if (!arr.length) return "";
    const L = arr.filter(p => isLeft(p.role));
    const R = arr.filter(p => isRight(p.role));
    const names = xs => xs.map(p => p.nome).slice(0, 3).join(", ");
    if (L.length || R.length) {
      const l = L.length ? names(L) : names(arr.slice(0, 1));
      const r = R.length ? names(R) : names(arr.slice(1, 3));
      return [l, r].filter(Boolean).join(" x ");
    }
    return names(arr.slice(0, 3));
  };

  // limitador simples de concorrência
  const limit = 4;
  let cursor = 0;
  const jobs = baseRows
    .map(r => r?.cnj)
    .filter(Boolean)
    .map(cnj => async () => {
      try {
        let parts = await apiGET(ENDPOINTS.parties(cnj)).catch(() => null);
        if (!Array.isArray(parts) || parts.length === 0) {
          const det = await apiGET(ENDPOINTS.details(cnj)).catch(() => null);
          parts = det?.header?.partes || [];
        }
        const preview = toPreview(parts);
        if (preview) {
          setRows(cur => {
            const out = cur.slice();
            const i = out.findIndex(x => x.cnj === cnj);
            if (i !== -1) out[i] = { ...out[i], partes: preview };
            return out;
          });
        }
      } catch {}
    });

  const workers = new Array(Math.min(limit, jobs.length)).fill(0).map(async () => {
    while (cursor < jobs.length) {
      const t = jobs[cursor++];
      await t();
    }
  });
  await Promise.all(workers);
}


/** ======= API do CPF.html ======= */
// Em dev usamos rota relativa (/pessoas) — o Vite proxy redireciona para o host real.
// Em produção (ou se quiser forçar), você pode setar VITE_PESSOAS_API no .env
const PESSOAS_API_PRIMARY =
  import.meta?.env?.VITE_PESSOAS_API || "/pessoas";
const PESSOAS_API_FALLBACK = "https://datahub.resolvecontas.com.br/api/pessoas";

/** ======= Helper p/ caminhos respeitando BASE_URL ======= */
const BASE_URL = (import.meta?.env?.BASE_URL ?? "/");
const BASE_PATH = BASE_URL.endsWith("/") ? BASE_URL.slice(0, -1) : BASE_URL; // sem barra final

/** Retorna caminho absoluto dentro do app, respeitando BASE_URL */
function normalizePath(p) {
  return p.startsWith(BASE_PATH)
    ? p
    : (p.startsWith("/") ? `${BASE_PATH}${p}` : `${BASE_PATH}/${p}`);
}
function rootUrl(file) {
  const clean = String(file || "").replace(/^\/+/, "");
  return `${BASE_PATH}/${clean}`;
}
function buildUrl(path, params) {
  const abs = normalizePath(path);
  if (!params) return abs;
  const u = new URL(abs, window.location.origin);
  Object.entries(params).forEach(([k, v]) => {
    if (v !== undefined && v !== null && String(v).length) u.searchParams.set(k, v);
  });
  return u.pathname + u.search;
}

/** ======= Rotas canônicas (SPA + estáticos em /public) ======= */
const PATHS = {
  // rotas SPA
  login: rootUrl("login"),
  home: rootUrl("home-consulta"),

  // arquivos estáticos
  cpf: rootUrl("cpf/CPF.html"),
  acordosHome: rootUrl("acordos/home/index.html"),
  originais: rootUrl("calculadoras/parcelas-originais/index.html"),
  refin: rootUrl("calculadoras/refinanciamento/index.html"),
  antecip: rootUrl("calculadoras/antecipacao/index.html"),
  escolhaOperacao: rootUrl("escolha-operacao/index.html"),
};

/** Prefixes de páginas estáticas — não devem ser redirecionadas pela SPA */
const STATIC_PREFIXES = ["/cpf/", "/acordos/", "/calculadoras/", "/escolha-operacao/"];
function isStaticPath(pathname) {
  const p = pathname.startsWith(BASE_PATH) ? pathname.slice(BASE_PATH.length) : pathname;
  return STATIC_PREFIXES.some((pref) => p.startsWith(pref));
}

/** ======= Navegação & Voltar ======= */
function currentTheme() {
  return localStorage.getItem("ui.theme") || sessionStorage.getItem("ui.theme") || "light";
}
/** Empilha origem (para botões Voltar dos HTMLs estáticos) */
function pushReturn(urlAbs) {
  try {
    const stack = JSON.parse(sessionStorage.getItem("spa.navStack") || "[]");
    stack.push(urlAbs);
    sessionStorage.setItem("spa.navStack", JSON.stringify(stack));
    sessionStorage.setItem("spa.returnTo", urlAbs);
    localStorage.setItem("spa.returnTo", urlAbs);
  } catch {}
}
/** Constrói URL alvo com ?theme=&returnTo= e extras (para páginas estáticas) */
function withContext(urlLike, returnToAbs, extraParams) {
  const href0 = urlLike.startsWith("http") ? urlLike : normalizePath(urlLike);
  const u = new URL(href0, window.location.origin);
  u.searchParams.set("theme", currentTheme());
  const rt = returnToAbs ? normalizePath(returnToAbs) : PATHS.home;
  u.searchParams.set("returnTo", rt);
  if (extraParams && typeof extraParams === "object") {
    Object.entries(extraParams).forEach(([k, v]) => {
      if (v !== undefined && v !== null && String(v).length) u.searchParams.set(k, v);
    });
  }
  return u.pathname + u.search;
}
/** Abre um arquivo estático (HTML em /public) */
function openStatic(urlLike, returnToAbs, extras) {
  const target = withContext(urlLike, returnToAbs, extras);
  try {
    // caminhos para as páginas estáticas (Escolha Operação/Calculadoras)
    sessionStorage.setItem("paths.acordos", PATHS.acordosHome);
    sessionStorage.setItem("paths.refin", PATHS.refin);
    sessionStorage.setItem("paths.antecip", PATHS.antecip);
    sessionStorage.setItem("paths.originais", PATHS.originais);
    localStorage.setItem("paths.acordos", PATHS.acordosHome);
    localStorage.setItem("paths.refin", PATHS.refin);
    localStorage.setItem("paths.antecip", PATHS.antecip);
    localStorage.setItem("paths.originais", PATHS.originais);
  } catch {}
  window.location.assign(target);
}
/** Navegação SPA (sem reload) */
function go(path, { replace = false } = {}) {
  const want = normalizePath(path);
  if (replace) window.history.replaceState({}, "", want);
  else window.history.pushState({}, "", want);
}

/* =================== Tema (tokens do CPF.html) =================== */
const CSS = `
:root{
  --bg:#F5F7FA; --card:#FFFFFF; --soft:#FAFBFF; --text:#1F2937; --muted:#6B7280; --border:#E5E7EB;
  --btn-primary-bg:#4B5563; --btn-primary-bg-hover:#434C59; --btn-primary-text:#FFFFFF; --btn-primary-border:transparent;
  --btn-secondary-bg:#EEF2F7; --btn-secondary-bg-hover:#E5EAF2; --btn-secondary-text:#1F2937; --btn-secondary-border:#CBD5E1;
  --ok:#16A34A; --ok-700:#11803A; --bad:#DC2626; --warn:#B45309;
  --thead:#EEF2FF; --row:#F9FAFB; --rowh:#F3F6FF; --input:#FFFFFF; --shadow:0 8px 30px rgba(9,30,66,.06);
  --brand-ink:#070c7b;
}
:root[data-theme="dark"]{
  --bg:#0f1222; --card:#151935; --soft:#1b2042; --text:#e8ecf3; --muted:#9aa3b2; --border:#2a2f53;
  --btn-primary-bg:#505A78; --btn-primary-bg-hover:#47506C; --btn-primary-text:#FFFFFF; --btn-primary-border:transparent;
  --btn-secondary-bg:#1b2042; --btn-secondary-bg-hover:#1f2550; --btn-secondary-text:#e8ecf3; --btn-secondary-border:#2f3564;
  --ok:#1DB954; --ok-700:#159c44; --bad:#e94b4b; --warn:#e5a100;
  --thead:#11162f; --row:#0e1330; --rowh:#151a3a; --input:#0e132b; --shadow:0 10px 30px rgba(0,0,0,.25);
  --brand-ink:#AFC7FF;
}
*{box-sizing:border-box}
html,body,#root{height:100%}
body{margin:0;background:var(--bg);color:var(--text);font-family:Inter,system-ui,Segoe UI,Roboto,Arial,sans-serif}

/* Utilitários */
.ui-card{background:var(--card);border:1px solid var(--border);border-radius:1.5rem;box-shadow:var(--shadow)}
.ui-border{border:1px solid var(--border)}
.ui-border-b{border-bottom:1px solid var(--border)}
.ui-soft{background:var(--soft)}
.ui-ink{color:var(--brand-ink)}
.ui-muted{color:var(--muted)}
.ui-input{
  width:100%;padding:.5rem .75rem;border-radius:.75rem;border:1px solid var(--border);
  background:var(--input);color:inherit;outline:none;
}
.ui-input:focus{box-shadow:0 0 0 2px #93C5FD}
.ui-tag{font-size:.75rem;padding:.25rem .5rem;border-radius:999px;background:var(--thead);border:1px solid var(--border);color:var(--brand-ink)}

/* Botões */
.btn{
  height:40px;padding:0 14px;border-radius:1rem;border:1px solid var(--btn-secondary-border);cursor:pointer;
  display:inline-flex;align-items:center;gap:.5rem;background:var(--btn-secondary-bg);color:var(--btn-secondary-text);
  font-weight:600;transition:background-color .12s ease,filter .12s ease;
}
.btn:hover{background:var(--btn-secondary-bg-hover)}
.btn.primary{background:var(--btn-primary-bg);color:var(--btn-primary-text);border-color:var(--btn-primary-border)}
.btn.primary:hover{filter:brightness(.98);background:var(--btn-primary-bg-hover)}
.btn.tiny{height:32px;padding:0 10px;border-radius:.6rem;font-size:.8rem}

/* Tabela */
.table-wrap{border:1px solid var(--border);border-radius:12px;overflow:auto}
.table th,.table td{padding:.5rem .75rem;border-bottom:1px solid var(--border);font-size:.875rem;text-align:left}
.table thead th{position:sticky;top:0;background:var(--thead);color:var(--brand-ink);z-index:1}
.table tbody tr:nth-child(even){background:var(--row)}
.table tbody tr:hover{background:var(--rowh)}

/* Drawer */
.drawer{position:fixed;inset:0;z-index:40}
.drawer-backdrop{position:absolute;inset:0;background:#0008;opacity:1}
.drawer-panel{
  position:absolute;right:0;top:0;height:100%;width:100%;max-width:720px;background:var(--card);
  border-left:1px solid var(--border);box-shadow:var(--shadow)
}
/* amplia ainda mais em telas grandes */
@media (min-width: 1024px){
  .drawer-panel{ max-width:840px }
}

/* Toggle de tema */
.theme-toggle{
  --w:56px; --h:30px; --pad:4px; display:inline-flex;align-items:center;width:var(--w);height:var(--h);
  border-radius:999px;background:linear-gradient(180deg,var(--soft),var(--row));border:1px solid var(--border);cursor:pointer;user-select:none;padding:var(--pad)
}
.theme-toggle .knob{
  width:22px;height:22px;border-radius:999px;background:var(--card);border:1px solid var(--border);
  display:grid;place-items:center;color:var(--muted)
}
`;

/* Provider simples */
function ThemeProvider({ children }) {
  const getInitial = () => localStorage.getItem("ui.theme") || sessionStorage.getItem("ui.theme") || "light";
  const [theme, setTheme] = useState(getInitial);
  useEffect(() => {
    document.documentElement.setAttribute("data-theme", theme);
    sessionStorage.setItem("ui.theme", theme);
    localStorage.setItem("ui.theme", theme); // garante leitura pelos HTMLs estáticos
    document.cookie = `ui_theme=${theme};path=/;max-age=31536000`;
  }, [theme]);
  return (
    <>
      <style>{CSS}</style>
      <div data-theme={theme}>{children}</div>
    </>
  );
}

function ThemeToggle() {
  const mode = localStorage.getItem("ui.theme") || sessionStorage.getItem("ui.theme") || "light";
  const [t, setT] = useState(mode);
  useEffect(() => {
    document.documentElement.setAttribute("data-theme", t);
    sessionStorage.setItem("ui.theme", t);
    localStorage.setItem("ui.theme", t);
    document.cookie = `ui_theme=${t};path=/;max-age=31536000`;
  }, [t]);
  return (
    <button
      type="button"
      className="theme-toggle"
      onClick={() => setT((p) => (p === "dark" ? "light" : "dark"))}
      aria-label="Alternar tema"
      title="Tema claro/escuro"
    >
      <span className="knob">
        {t === "dark"
          ? <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M21.64 13.02A9 9 0 1 1 11 2.36 7 7 0 1 0 21.64 13.02Z"/></svg>
          : <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M12 4.5a1 1 0 0 1 1 1V7a1 1 0 1 1-2 0V5.5a1 1 0 0 1 1-1Zm0 11a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Z"/></svg>}
      </span>
    </button>
  );
}

/* =================== Helpers & formatters =================== */
const cx = (...c) => c.filter(Boolean).join(" ");
const onlyDigits = (s) => (s || "").replace(/\D+/g, "");
const isCpfOk = (v) => onlyDigits(v).length === 11;
const fmtBRL = (v) => Number(v || 0).toLocaleString("pt-BR",{style:"currency",currency:"BRL"});
const fmtDate = (d) => (d ? new Date(d).toLocaleDateString("pt-BR") : "—");
const toNum = (v) => {
  if (v == null) return 0;
  if (typeof v === "number") return v;
  const n = Number(String(v).replace(/\./g,"").replace(",",".")); return isNaN(n) ? 0 : n;
};
const getRoot = (p) => {
  if (Array.isArray(p?.result) && p.result.length) return p.result[0];
  if (p?.data && Array.isArray(p.data?.result) && p.data.result.length) return p.data.result[0];
  return p;
};
function parsePayload(payload, cpfDigitado) {
  const root = getRoot(payload) || {};
  const nomeCliente = root?.pessoa?.nome || root?.cliente?.nomeCliente || root?.nomeCliente || "";
  const cpfCliente  = root?.pessoa?.cpf  || root?.cliente?.cpfCliente  || root?.cpfCliente  || cpfDigitado || "";

  const seenA = new Set();
  const allA = []
    .concat(root?.acordo_ativo || [])
    .concat(root?.acordos || []);
  const contratosComAcordo = new Set();
  for (const it of allA){
    const id = it.acordoId || it.id;
    const ativo = /(ATIV|REGUL)/i.test(String(it.situacao||it.situacaoAcordo||it.status||it.active||""));
    if (!ativo || !id || seenA.has(String(id))) continue;
    seenA.add(String(id));
    const cnum = it.numContrato || it.contrato_id || it.numeroContrato || "";
    if (cnum) contratosComAcordo.add(String(cnum));
  }

  const src = Array.isArray(root?.contratos) ? root.contratos : [];
  const map = new Map();
  for (const c of src){
    const contratoId = String(c.numeroContrato || c.numContrato || c.contrato_id || "").trim();
    if (!contratoId || map.has(contratoId)) continue;

    const valorParcela = toNum(c.valorParcela || c.ValorParcela || 0);
    const nParcelas = Number(c.parcelasContrato || c.NumeroParcela || 0);
    const pagas = Number(c.parcelasPagas || 0);
    const teoricoAberto = Math.max(0, (nParcelas - pagas) * valorParcela);

    const saldoApi = toNum(
      c.saldoAPagar || c.SaldoAPagar || c.saldo_a_pagar || c.valorPendenteAmortizacao ||
      c.valorPendente || c.saldo || c.saldoAtual || 0
    );

    const saldoAtual = saldoApi > 0 ? saldoApi : teoricoAberto;
    const pagamentoParcial = saldoApi > 0 && saldoApi < (teoricoAberto - 0.005);

    map.set(contratoId, {
      contrato: contratoId,
      carteira: c.nomeCarteira || c.carteira || "",
      valorContratado: toNum(c.valorContratado || c.ValorContratado || 0),
      valorParcela,
      nParcelas,
      parcelasPagas: pagas,
      jurosMes: Number(c.taxaFinanceira || c.jurosMensais || 0) * (Number(c.taxaFinanceira||0) < 1? 100:1),
      dataUltVenc: c.dataVencimento || c.ultimoVencimento || "",
      saldoAtual, teoricoAberto, pagamentoParcial,
      temAcordoAtivo: contratosComAcordo.has(contratoId)
    });
  }
  return { nomeCliente, cpfCliente, contratos: Array.from(map.values()) };
}

/* =================== Mocks (apenas se DEMO_APP) =================== */
const mockRows = [
  { cnj:"0006275-72.2023.8.26.0320", partes:"BANCO X S/A x Lucas C.", foro:"Foro Central SP", vara:"12ª Vara Cível", sistema:"TJSP-ESAJ", situacao:"Em andamento", ultimaMov:"10/08/2025" },
  { cnj:"0007134-29.2024.8.26.0005", partes:"EMPRESA Y LTDA x João S.", foro:"Butantã", vara:"3ª Vara Cível", sistema:"TJSP-ESAJ", situacao:"Concluso", ultimaMov:"02/08/2025" },
];
const mockMovs = {
  "0006275-72.2023.8.26.0320":[
    { data:"10/08/2025", movimentacao:"Juntada de petição – manifestação do autor." },
    { data:"03/08/2025", movimentacao:"Conclusos para decisão." },
    { data:"29/07/2025", movimentacao:"Certidão: decurso de prazo." },
  ],
  "0007134-29.2024.8.26.0005":[
    { data:"02/08/2025", movimentacao:"Despacho proferido." },
    { data:"25/07/2025", movimentacao:"Citação realizada." },
  ],
};

/* =================== UI Básica =================== */
function Brand() {
  return (
    <div className="flex items-center gap-2">
      <svg width="26" height="26" viewBox="0 0 24 24" fill="none">
        <circle cx="12" cy="12" r="10" stroke="var(--brand-ink)" strokeWidth="2" />
        <path d="M8 12h8M12 8v8" stroke="var(--brand-ink)" strokeWidth="2" strokeLinecap="round" />
      </svg>
      <span className="font-semibold ui-ink">SaiuAcordo • Jurídico</span>
    </div>
  );
}
function Button({ children, icon: Icon, loading, className = "", ...props }) {
  return (
    <button {...props} className={cx("btn", className)}>
      {loading ? <Loader2 className="h-4 w-4 animate-spin" /> : Icon ? <Icon className="h-4 w-4" /> : null}
      <span className="truncate">{children}</span>
    </button>
  );
}
function PrimaryButton(props) { return <Button {...props} className={cx("primary", props.className)} />; }
function Tag({ children }) { return <span className="ui-tag">{children}</span>; }
function Card({ title, right, children }) {
  return (
    <div className="ui-card">
      <div className="flex items-center justify-between px-4 py-3 ui-border-b">
        <div className="font-semibold" style={{ color: "var(--text)" }}>{title}</div>
        <div>{right}</div>
      </div>
      <div className="p-4">{children}</div>
    </div>
  );
}
function Field({ label, hint, children }) {
  return (
    <label className="w-full text-sm">
      <div className="mb-1 font-medium" style={{ color: "var(--text)" }}>{label}</div>
      {children}
      {hint ? <div className="text-xs ui-muted mt-1">{hint}</div> : null}
    </label>
  );
}
function Input(props) { return <input {...props} className="ui-input" />; }

/** Drawer (abre só quando open=true) */
function Drawer({ open, onClose, children }) {
  if (!open) return null;
  return (
    <div className="drawer">
      <div className="drawer-backdrop" onClick={onClose} />
      <div className="drawer-panel">
        <div className="flex items-center justify-between px-4 py-3 ui-border-b">
          <Brand />
          <Button icon={X} onClick={onClose}>Fechar</Button>
        </div>
        <div className="p-4 overflow-y-auto" style={{ height: "calc(100% - 56px)" }}>{children}</div>
      </div>
    </div>
  );
}

/* =================== API helpers (processos) =================== */
async function apiGET(url) {
  if (!DEMO_APP) {
    const r = await fetch(url, { credentials: "include" });
    if (!r.ok) throw new Error(`GET ${url} -> ${r.status}`);
    return r.json();
  }
  if (url.includes("/auth/me")) return { ok: true, demo: true };
  if (url.includes("/processes/")) {
    const cnj = decodeURIComponent(url.split("/processes/")[1].split("/movements")[0]);
    return mockMovs[cnj] || [];
  }
  if (url.includes("/processes/search")) {
    const u = new URL(url, "http://x");
    const q = Object.fromEntries(u.searchParams);
    if (q.cnj) return mockRows.filter((r) => r.cnj === q.cnj) || [];
    return mockRows;
  }
  return {};
}
async function apiPOST(url, body) {
  if (!DEMO_APP) {
    const r = await fetch(url, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      credentials: "include",
      body: JSON.stringify(body || {}),
    });
    if (!r.ok) throw new Error(`POST ${url} -> ${r.status}`);
    return r.json();
  }
  if (url.includes("/auth/login")) return { ok: true };
  if (url.includes("/auth/tjsp/connect")) return { url: "#" };
  if (url.includes("/processes/import-csv")) return { ok: true, imported: 2 };
  return { ok: true };
}

/** ===== API do CPF.html – consulta por CPF OU por Contrato (com fallback CORS) ===== */
async function fetchPessoa({ cpfDigits, contrato }, controller) {
  const build = (base) => {
    const u = base.startsWith("http")
      ? new URL(base)
      : new URL(base, window.location.origin);
    if (cpfDigits) u.searchParams.set("cpf", cpfDigits);
    if (!cpfDigits && contrato) u.searchParams.set("contrato", contrato);
    u.searchParams.set("_", Date.now());
    return u.toString();
  };
  const tryFetch = async (base) => {
    const url = build(base);
    const sameOrigin = !base.startsWith("http");
    const res = await fetch(url, {
      method: "GET",
      cache: "no-store",
      signal: controller?.signal,
      mode: sameOrigin ? "same-origin" : "cors",
      credentials: sameOrigin ? "same-origin" : "omit",
    });
    if (!res.ok) throw new Error(`API ${res.status}`);
    return res.json();
  };
  // 1) primária (proxy/variável)
  try {
    return await tryFetch(PESSOAS_API_PRIMARY);
  } catch (err1) {
    // 2) fallback
    try {
      console.warn("Pessoa API primary failed, trying fallback:", err1);
      return await tryFetch(PESSOAS_API_FALLBACK);
    } catch (err2) {
      console.error("Pessoa API fallback failed:", err2);
      throw err2;
    }
  }
}

// --- helpers para detecção do tipo ---
const detectIdType = (digits) => {
  if (!digits) return null;
  if (digits.length <= 7) return "oab";
  if (digits.length === 11) return "cpf";
  if (digits.length === 14) return "cnpj";
  if (digits.length >= 12) return "cnpj";
  return "cpf";
};

// --- campo único com máscara dinâmica estilo Pix ---
function SmartIdInput({ valueDigits, onDigitsChange, onTypeChange, ...props }) {
  const masks = [
    { mask: "0000000",   id: "oab"  },                // até 7
    { mask: "000.000.000-00", id: "cpf"  },          // 11
    { mask: "00.000.000/0000-00", id: "cnpj" },      // 14
  ];

  return (
    <IMaskInput
      mask={masks.map(m => ({ mask: m.mask, lazy: true }))}
      dispatch={(appended, dynamicMasked) => {
        const digits = (dynamicMasked.value + appended).replace(/\D/g, "");
        const choose = digits.length >= 12 ? "00.000.000/0000-00"
                    : digits.length >= 8  ? "000.000.000-00"
                    :                       "0000000";
        return dynamicMasked.compiledMasks.find(m => m.mask === choose);
      }}
      unmask={true}
      value={valueDigits}
      onAccept={(unmasked, maskRef) => {
        const digits = maskRef?.unmaskedValue ?? String(unmasked || "");
        onDigitsChange?.(digits);
        onTypeChange?.(detectIdType(digits));
      }}
      inputMode="numeric"
      className="ui-input"
      placeholder="OAB, CPF ou CNPJ"
      {...props}
    />
  );
}

/* =================== Views =================== */
function LoginView({ onLogged }) {
  // --------- login do sistema ---------
  const [idDigits, setIdDigits] = useState("");         // dígitos do campo único
  const [docType, setDocType] = useState(null);         // 'oab' | 'cpf' | 'cnpj'
  const [uf, setUf] = useState(() => localStorage.getItem("login.uf") || "SP");
  const [password, setPassword] = useState("");
  const [showPwd, setShowPwd] = useState(false);
  const [remember, setRemember] = useState(() => localStorage.getItem("login.remember") === "1");
  const [loading, setLoading] = useState(false);
  const [err, setErr] = useState("");

  // --------- fluxo de conexão TJSP ---------
  const [tjspOpen, setTjspOpen] = useState(false);
  const [tjspStep, setTjspStep] = useState("creds");   // "creds" | "otp" | "done"
  const [tjspUser, setTjspUser] = useState("");        // CPF/CNPJ do TJSP (11/14)
  const [tjspPass, setTjspPass] = useState("");        // senha do TJSP
  const [tjspFlow, setTjspFlow] = useState(null);      // flowId do backend
  const [tjspCode, setTjspCode] = useState("");        // código 2FA
  const [tjspCountdown, setTjspCountdown] = useState(180); // 3min
  const [tjspErr, setTjspErr] = useState("");
  const [tjspLoading, setTjspLoading] = useState(false);
  const [tjspPopup, setTjspPopup] = useState(null);    // window popup do TJSP

  // --------- efeitos auxiliares ---------
  useEffect(() => {
    if (!remember) {
      localStorage.setItem("login.remember", "0");
      localStorage.removeItem("login.id");
      localStorage.removeItem("login.uf");
      return;
    }
    localStorage.setItem("login.remember", "1");
    localStorage.setItem("login.id", idDigits);
    if (docType === "oab") localStorage.setItem("login.uf", uf);
  }, [remember, idDigits, docType, uf]);

  useEffect(() => {
    const savedId = localStorage.getItem("login.id");
    if (savedId) setIdDigits(savedId.replace(/\D/g, "").slice(0, 14));
  }, []);

  // contador do OTP (3min) quando a etapa é "otp"
  useEffect(() => {
    if (!tjspOpen || tjspStep !== "otp") return;
    setTjspCountdown(180);
    const iv = setInterval(() => {
      setTjspCountdown((s) => (s > 0 ? s - 1 : 0));
    }, 1000);
    return () => clearInterval(iv);
  }, [tjspOpen, tjspStep]);

  // polling de status do flowId (detecta "connected" caso o backend finalize lá)
  useEffect(() => {
    let stop = false;
    (async () => {
      if (!tjspOpen || !tjspFlow) return;
      while (!stop && tjspStep !== "done") {
        try {
          // GET ?flowId=
          let ok = false;
          try {
            const u = new URL(ENDPOINTS.tjspPing, window.location.origin);
            u.searchParams.set("flowId", tjspFlow);
            const r = await fetch(u.toString(), { credentials: "include" });
            if (r.ok) {
              const j = await r.json().catch(() => ({}));
              const st = j?.status || j?.state || "";
              if (st === "connected") { setTjspStep("done"); break; }
              ok = true;
            }
          } catch {}
          // fallback POST
          if (!ok) {
            const r2 = await fetch(ENDPOINTS.tjspPing, {
              method: "POST",
              credentials: "include",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify({ flowId: tjspFlow })
            });
            if (r2.ok) {
              const j2 = await r2.json().catch(() => ({}));
              const st2 = j2?.status || j2?.state || "";
              if (st2 === "connected") { setTjspStep("done"); break; }
            }
          }
        } catch {}
        await new Promise(res => setTimeout(res, 3000));
      }
    })();
    return () => { stop = true; };
  }, [tjspOpen, tjspFlow, tjspStep]);

  // --------- login do sistema ---------
  const canSubmit = !!docType && !!password && (
    (docType === "oab"  && idDigits.length >= 1 && idDigits.length <= 7) ||
    (docType === "cpf"  && idDigits.length === 11) ||
    (docType === "cnpj" && idDigits.length === 14)
  );

  const doLogin = async () => {
    setErr("");
    if (!canSubmit) { setErr("Digite OAB (até 7 dígitos), CPF (11) ou CNPJ (14) e a senha."); return; }
    try {
      setLoading(true);
      const body = (docType === "oab")
        ? { oab: idDigits, uf: uf.toUpperCase(), password }
        : { cpfCnpj: idDigits, password };
      await apiPOST(ENDPOINTS.login, body);
      try { sessionStorage.setItem("demo.logged", "1"); } catch {}
      onLogged?.();
    } catch {
      setErr("Não foi possível entrar. Verifique os dados.");
    } finally {
      setLoading(false);
    }
  };

  const handleEnter = (e) => { if (e.key === "Enter") doLogin(); };

  // --------- fluxo TJSP: ações ---------
  const connectTJSP = () => {
    setTjspOpen(true);
    setTjspErr("");
    setTjspStep("creds");
    setTjspFlow(null);
    setTjspCode("");
    const guess = (docType === "cpf" || docType === "cnpj") ? idDigits : "";
    setTjspUser(guess);
    setTjspPass("");
  };

  const startTJSP = async () => {
    try {
      setTjspErr("");
      setTjspLoading(true);

      const digits = String(tjspUser || "").replace(/\D+/g, "");
      if (!/^(\d{11}|\d{14})$/.test(digits)) {
        setTjspErr("Use CPF (11) ou CNPJ (14) do titular no TJSP.");
        return;
      }
      if (!tjspPass) {
        setTjspErr("Informe a senha do TJSP.");
        return;
      }

      const payload = {
        user: digits, pass: tjspPass,
        cpfCnpj: digits, password: tjspPass,
        ...(docType === "oab" ? { oab: idDigits, uf: String(uf || "").toUpperCase() } : {})
      };

      const r = await fetch(ENDPOINTS.tjspConnect, {
        method: "POST",
        credentials: "include",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload)
      });
      const j = await r.json().catch(() => ({}));
      const flowId = j?.flowId || j?.id;

      if (!r.ok || !flowId) {
        setTjspErr(j?.error || j?.message || "Falha ao iniciar a conexão com o TJSP.");
        return;
      }

      setTjspFlow(flowId);
      setTjspStep("otp");

      const popupUrl = j?.popupUrl || j?.url || null;
      if (popupUrl) {
        try {
          const w = window.open(popupUrl, "tjsp", "width=480,height=740,noopener");
          setTjspPopup(w || null);
        } catch {
          // popup bloqueado: o usuário ainda consegue focar via botão
        }
      }
    } catch {
      setTjspErr("Erro ao conectar ao TJSP.");
    } finally {
      setTjspLoading(false);
    }
  };

  const sendTJSPCode = async () => {
    try {
      setTjspErr("");
      setTjspLoading(true);

      const code = String(tjspCode || "").trim();
      if (!code) { setTjspErr("Digite o código recebido por e-mail."); return; }

      const r = await fetch(ENDPOINTS.tjspOtp, {
        method: "POST",
        credentials: "include",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ flowId: tjspFlow, code, otp: code })
      });
      const j = await r.json().catch(() => ({}));

      if (r.ok && (j?.ok || j?.status === "connected")) {
        setTjspStep("done");
      } else {
        setTjspErr(j?.error || j?.message || "Código incorreto ou expirado.");
      }
    } catch {
      setTjspErr("Erro ao enviar o código ao TJSP.");
    } finally {
      setTjspLoading(false);
    }
  };

  const resendTJSPCode = async () => {
    try {
      setTjspErr("");
      setTjspLoading(true);

      const postJson = async (url, body) => {
        const r = await fetch(url, {
          method: "POST",
          credentials: "include",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(body)
        });
        if (!r.ok) return null;
        return r.json().catch(() => ({}));
      };

      let ok = false;
      if (ENDPOINTS.tjspResend) {
        const j = await postJson(ENDPOINTS.tjspResend, { flowId: tjspFlow });
        if (j && (j.ok || j.status === "resent" || j.status === "waiting-otp")) ok = true;
      }
      if (!ok) {
        const j2 = await postJson(ENDPOINTS.tjspConnect, { flowId: tjspFlow, action: "resend" });
        if (j2 && (j2.ok || j2.status === "resent" || j2.status === "waiting-otp")) ok = true;
      }
      if (!ok) {
        if (tjspPopup && !tjspPopup.closed) tjspPopup.focus();
        setTjspErr("Não consegui solicitar pelo backend. Clique em “Receber novo código” no popup do TJSP.");
        return;
      }

      setTjspCountdown(180);
      setTjspErr("Novo código solicitado. Verifique seu e-mail.");
    } catch {
      setTjspErr("Erro ao solicitar novo código.");
    } finally {
      setTjspLoading(false);
    }
  };

  // --------- JSX ---------
  return (
    <>
      <div className="min-h-screen flex items-center justify-center p-4" style={{ background: "var(--bg)" }}>
        <div className="w-full max-w-md ui-card p-6" onKeyDown={handleEnter}>
          <div className="flex items-center justify-between mb-6">
            <Brand />
            <div className="flex items-center gap-2">
              <ThemeToggle />
              <Tag>Advogado</Tag>
            </div>
          </div>

          <div className="grid gap-3">
            {/* Campo único com máscara dinâmica */}
            <div>
              <label className="ui-label">OAB, CPF ou CNPJ</label>
              <SmartIdInput
                valueDigits={idDigits}
                onDigitsChange={setIdDigits}
                onTypeChange={setDocType}
              />
            </div>

            {/* UF só aparece quando for OAB */}
            {docType === "oab" && (
              <div>
                <label className="ui-label">UF</label>
                <select
                  className="ui-input"
                  value={uf}
                  onChange={(e) => setUf(e.target.value.toUpperCase())}
                >
                  {["AC","AL","AM","AP","BA","CE","DF","ES","GO","MA","MG","MS","MT","PA","PB","PE","PI","PR","RJ","RN","RO","RR","RS","SC","SE","SP","TO"].map(u => (
                    <option key={u} value={u}>{u}</option>
                  ))}
                </select>
              </div>
            )}

            <div>
              <label className="ui-label">Senha</label>
              <div className="relative">
                <Input
                  type={showPwd ? "text" : "password"}
                  placeholder="••••••••"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                />
                <button
                  type="button"
                  className="ui-input-ghost"
                  style={{ position: "absolute", right: 8, top: 8 }}
                  onClick={() => setShowPwd(s => !s)}
                >
                  {showPwd ? "Ocultar" : "Mostrar"}
                </button>
              </div>
            </div>

            {err && <div className="ui-error">{err}</div>}

            <div className="flex items-center justify-between">
              <label className="flex items-center gap-2 text-sm ui-muted cursor-pointer">
                <input type="checkbox" checked={remember} onChange={(e)=>setRemember(e.target.checked)} />
                Lembrar meus dados neste dispositivo
              </label>
            </div>

            <div className="flex items-center gap-2 pt-1">
              <PrimaryButton icon={LogIn} onClick={doLogin} loading={loading} disabled={!canSubmit}>
                Entrar
              </PrimaryButton>
              <Button icon={ShieldCheck} onClick={connectTJSP} disabled={loading}>
                Conectar TJSP
              </Button>
            </div>

            <div className="ui-muted text-xs">
              Problemas para entrar? Procure o administrador para resetar sua senha.
            </div>
          </div>
        </div>
      </div>

      {/* Modal TJSP */}
      <Drawer open={tjspOpen} onClose={() => setTjspOpen(false)}>
        <div className="space-y-4">
          <div className="ui-ink font-semibold text-lg">Conectar ao TJSP</div>
          <div className="ui-muted text-sm">
            As credenciais do <b>TJSP</b> são <u>diferentes</u> das credenciais do seu acesso no sistema.
            Use aqui o <b>CPF/CNPJ e senha do TJSP</b>. Abriremos a janela oficial do TJSP; mantenha-a aberta.
          </div>

          {tjspStep === "creds" && (
            <div className="grid gap-3">
              <Field label="CPF/CNPJ (TJSP)">
                <Input
                  inputMode="numeric"
                  placeholder="somente números"
                  value={tjspUser}
                  onChange={(e) => setTjspUser((e.target.value || "").replace(/\D+/g, ""))}
                />
              </Field>
              <Field label="Senha (TJSP)">
                <Input
                  type="password"
                  placeholder="senha do TJSP"
                  value={tjspPass}
                  onChange={(e) => setTjspPass(e.target.value)}
                />
              </Field>
              {tjspErr && <div className="ui-error">{tjspErr}</div>}
              <div className="flex items-center gap-2">
                <PrimaryButton onClick={startTJSP} loading={tjspLoading}>Iniciar conexão</PrimaryButton>
                <Button onClick={() => setTjspOpen(false)}>Cancelar</Button>
              </div>
            </div>
          )}

          {tjspStep === "otp" && (
            <div className="grid gap-3">
              <div className="ui-muted text-sm">
                A janela do TJSP está aguardando o código de verificação enviado ao seu e-mail.
                Digite o código abaixo e enviaremos para o TJSP automaticamente.
              </div>
              <Field label="Código (6 dígitos)">
                <Input
                  placeholder="ex.: 123456"
                  value={tjspCode}
                  onChange={(e) => setTjspCode(e.target.value)}
                />
              </Field>
              {tjspErr && <div className="ui-error">{tjspErr}</div>}
              <div className="flex items-center gap-2">
                <PrimaryButton onClick={sendTJSPCode} loading={tjspLoading}>Enviar código</PrimaryButton>
                <Button onClick={resendTJSPCode} disabled={tjspCountdown > 0 || tjspLoading}>
                  {tjspCountdown > 0 ? `Pedir novo código em ${tjspCountdown}s` : "Pedir novo código"}
                </Button>
                <Button onClick={() => { if (tjspPopup && !tjspPopup.closed) tjspPopup.focus(); }}>
                  Ir para janela do TJSP
                </Button>
              </div>
              <div className="ui-muted text-xs">
                Se o e-mail demorar ou expirar, você pode pedir um novo código aqui (tentamos acionar no TJSP)
                ou clicar em <b>“Receber novo código”</b> no próprio popup do TJSP.
              </div>
            </div>
          )}

          {tjspStep === "done" && (
            <div className="grid gap-3">
              <div className="ui-tag">Conectado ao TJSP ✅</div>
              <PrimaryButton onClick={() => setTjspOpen(false)}>Fechar</PrimaryButton>
            </div>
          )}
        </div>
      </Drawer>
    </>
  );
}

function ProcessesGrid({ rows, loading, onOpen, onRefresh }) {
  return (
    <Card
      title={<div className="flex items-center gap-2"><span>Processos</span><Tag>{rows.length}</Tag></div>}
      right={<Button icon={RefreshCw} onClick={onRefresh}>Atualizar</Button>}
    >
      <div className="table-wrap">
        <table className="w-full table">
          <thead>
            <tr>
              {["CNJ","Partes","Foro/Vara","Sistema","Situação","Última Mov.","Ações"].map(h=>(
                <th key={h} className="font-medium">{h}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {loading ? (
              <tr><td colSpan={7} className="px-3 py-8 text-center ui-muted">
                <Loader2 className="animate-spin h-4 w-4 inline mr-2" /> Carregando…
              </td></tr>
            ) : rows.length === 0 ? (
              <tr><td colSpan={7} className="px-3 py-6 text-center ui-muted">Nenhum processo.</td></tr>
            ) : (
              rows.map((r,i)=>(
                <tr key={r.cnj+i}>
                  <td className="font-mono text-[12px]">{r.cnj}</td>
                  <td>{r.partes}</td>
                  <td>{r.foro} • {r.vara}</td>
                  <td><Tag>{r.sistema}</Tag></td>
                  <td>{r.situacao}</td>
                  <td>{r.ultimaMov}</td>
                  <td>
                    <div className="flex items-center gap-2">
                      <Button icon={FileText} onClick={()=>onOpen(r)}>Ver</Button>
                      <Button icon={Bell} onClick={()=>alert("Em breve: alertas")}>Alertas</Button>
                    </div>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>
    </Card>
  );
}

function Drilldown({ proc, onClose }) {
  const [tab, setTab] = useState("resumo");
  const [movs, setMovs] = useState([]);
  const [details, setDetails] = useState(null);
  const [loadingMov, setLoadingMov] = useState(true);
  const [loadingDet, setLoadingDet] = useState(true);

  useEffect(() => {
    if (!proc) return;
  
    setLoadingDet(true);
    (async () => {
      try {
        // 1) detalhes básicos
        let d = await apiGET(ENDPOINTS.details(proc.cnj));
        d = d || {};
  
        // 2) partes da tabela nova
        try {
          const parts = await apiGET(ENDPOINTS.parties(proc.cnj));
          const norm = normalizeParties(parts);
          if (norm.length) {
            d.header = d.header || {};
            d.header.partes = norm; // agora o "Resumo" já enxerga
          }
        } catch { /* se 404/erro, segue sem quebrar */ }
  
        setDetails(d);
      } finally {
        setLoadingDet(false);
      }
    })();
  
    setLoadingMov(true);
    (async () => {
      const data = await apiGET(ENDPOINTS.movements(proc.cnj));
      setMovs(data || []);
      setLoadingMov(false);
    })();
  }, [proc]);

  const InfoRow = ({label, value}) => (
    <div className="grid grid-cols-3 gap-2 py-1 text-sm">
      <div className="ui-muted">{label}</div>
      <div className="col-span-2">{value ?? "—"}</div>
    </div>
  );

  return (
    <Drawer open={!!proc} onClose={onClose}>
      {!proc ? null : (
        <div className="space-y-4">
          <div className="flex items-start justify-between gap-2">
            <div>
              <div className="ui-ink font-semibold">{proc.cnj}</div>
              <div className="text-sm ui-muted">{proc.partes}</div>
            </div>
            <div className="flex items-center gap-2">
              <Tag>{proc.sistema}</Tag>
              <Tag>{proc.situacao}</Tag>
            </div>
          </div>

          <div className="flex items-center gap-2 ui-border-b overflow-x-auto whitespace-nowrap">
            {["resumo","movs","pet","inc","ap","aud"].map(k=>{
              const label = {resumo:"Resumo",movs:"Movimentações",pet:"Petições",inc:"Incidentes",ap:"Apensos",aud:"Audiências"}[k];
              return (
                <button key={k} onClick={()=>setTab(k)}
                  className={cx("px-3 py-2 text-sm shrink-0", tab===k?"ui-ink ui-border-b":"ui-muted")}>
                  {label}
                </button>
              );
            })}
          </div>

          {tab==="resumo" && (
            <Card title="Resumo" right={loadingDet ? <Tag>carregando…</Tag> : null}>
              {!details ? <div className="ui-muted text-sm">Sem dados.</div> : (
                <div>
                  <InfoRow label="Classe" value={details.header?.classe}/>
                  <InfoRow label="Assunto" value={details.header?.assunto}/>
                  <InfoRow label="Área" value={details.header?.area}/>
                  <InfoRow label="Foro" value={details.header?.foro}/>
                  <InfoRow label="Vara" value={details.header?.vara}/>
                  <InfoRow label="Juiz" value={details.header?.juiz}/>
                  <InfoRow label="Distribuição" value={fmtDate(details.header?.distribution_at)}/>
                  <InfoRow label="Controle" value={details.header?.control_code}/>
                  <InfoRow label="Valor da ação" value={details.header?.valor_acao ? fmtBRL(details.header.valor_acao) : "—"}/>
                  <div className="mt-3">
                    <div className="ui-muted text-sm mb-1">Partes</div>
                    <div className="ui-border rounded-lg p-3 text-sm">
                      {Array.isArray(details.header?.partes) && details.header.partes.length
                        ? details.header.partes.map((p,i)=>{
                          const role = p.role || "Parte";
                          const nome = p.nome ?? p.name ?? "";
                          const doc  = p.doc ?? p.document ?? "";
                          return <div key={i}><b>{role}</b>: {nome}{doc ? ` — ${doc}` : ""}</div>;
                        })
                        : <span className="ui-muted">—</span>}
                    </div>
                  </div>
                </div>
              )}
            </Card>
          )}

          {tab==="movs" && (
            <div className="ui-border" style={{ borderRadius: 12, overflow: "hidden" }}>
              <table className="w-full table">
                <thead>
                <tr><th className="w-32">Data</th><th>Descrição</th></tr>
                </thead>
                <tbody>
                {loadingMov ? (
                  <tr><td colSpan={2} className="px-3 py-8 text-center ui-muted">
                    <Loader2 className="h-4 w-4 inline animate-spin mr-2"/>Carregando…
                  </td></tr>
                ) : movs.length === 0 ? (
                  <tr><td colSpan={2} className="px-3 py-8 text-center ui-muted">Sem movimentações.</td></tr>
                ) : movs.map((m,i)=>(
                  <tr key={i}>
                    <td className="whitespace-nowrap">{m.data}</td>
                    <td className="leading-relaxed">{m.movimentacao}</td>
                  </tr>
                ))}
                </tbody>
              </table>
            </div>
          )}

          {tab!=="resumo" && tab!=="movs" && (
            <Card title={
              {pet:"Petições Diversas",inc:"Incidentes/Recursos/Execuções",ap:"Apensos/Entranhados/Unificados",aud:"Audiências"}[tab]
            }>
              {!details ? <div className="ui-muted text-sm">Sem dados.</div> : (() => {
                const data = {pet:"peticoes",inc:"incidentes",ap:"apensos",aud:"audiencias"}[tab];
                const arr = details.extras?.[data] || [];
                if (!arr.length) return <div className="ui-muted text-sm">Sem registros.</div>;
                return (
                  <div className="table-wrap">
                    <table className="w-full table">
                      <thead><tr><th>Info</th></tr></thead>
                      <tbody>
                        {arr.map((it, i)=>(
                          <tr key={i}><td className="text-sm">
                            {it.data || it.hora ? <b>{[it.data, it.hora].filter(Boolean).join(" ")}: </b> : null}
                            {it.tipo ? <>{it.tipo}</> : it.descricao ? <>{it.descricao}</> : it.texto}
                          </td></tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                );
              })()}
            </Card>
          )}
        </div>
      )}
    </Drawer>
  );
}

/** ======= Consulta rápida (CPF/Contrato) — somente Consultar/Limpar ======= */
function CpfShortcutCard() {
  const [cpf, setCpf] = useState("");
  const [contrato, setContrato] = useState("");
  const [loading, setLoading] = useState(false);
  const [msg, setMsg] = useState("");
  const [cliente, setCliente] = useState(null);
  const [contratos, setContratos] = useState([]);
  const [lastPayload, setLastPayload] = useState(null);

  const runFetch = async (cpfDigits, contratoText) => {
    if (DEMO_CPF) {
      return {
        pessoa: { nome: contratoText ? "Cliente do Contrato" : "Cliente Demo", cpf: cpfDigits || "00000000000" },
        contratos: [
          { numContrato: contratoText || "CTR-001", nomeCarteira: "Demo", valorContratado: 3200, valorParcela: 320, parcelasContrato: 12, parcelasPagas: 4, dataVencimento: "2025-10-10", taxaFinanceira: 0.028, saldoAtual: 2400 },
          { numContrato: (contratoText ? contratoText+"-B" : "CTR-002"), nomeCarteira: "Demo", valorContratado: 4100, valorParcela: 410, parcelasContrato: 10, parcelasPagas: 7, dataVencimento: "2025-09-15", taxaFinanceira: 0.032, saldoAtual: 1200 }
        ],
        acordo_ativo: [{ id:"A1", numContrato: contratoText || "CTR-001", situacao:"ATIVO"}]
      };
    }
    const ctrl = new AbortController();
    return fetchPessoa(
      { cpfDigits: cpfDigits || null, contrato: (!cpfDigits && contratoText) ? contratoText : null },
      ctrl
    );
  };

  const prepararSession = (payload, cpfDigits, contratoText) => {
    try {
      sessionStorage.setItem("last.cpf.response", JSON.stringify(payload));
      if (cpfDigits) sessionStorage.setItem("wizard.cpf", cpfDigits);
      if (contratoText) sessionStorage.setItem("wizard.contractFilter", contratoText);
      sessionStorage.setItem("spa.returnTo", PATHS.home);
      sessionStorage.setItem("paths.acordos", PATHS.acordosHome);
      sessionStorage.setItem("paths.refin", PATHS.refin);
      sessionStorage.setItem("paths.antecip", PATHS.antecip);
      sessionStorage.setItem("paths.originais", PATHS.originais);
      localStorage.setItem("paths.acordos", PATHS.acordosHome);
      localStorage.setItem("paths.refin", PATHS.refin);
      localStorage.setItem("paths.antecip", PATHS.antecip);
      localStorage.setItem("paths.originais", PATHS.originais);
      localStorage.setItem("ui.theme", currentTheme());
    } catch {}
  };

  // === AUTO-CONSULTA via querystring ===
  useEffect(() => {
    const qs = new URLSearchParams(window.location.search);
    const cpfQ = onlyDigits(qs.get("cpf") || "");
    const contratoQ = (qs.get("contrato") || "").trim();

    if (!cpfQ && !contratoQ) return;

    let cancel = false;
    (async () => {
      setMsg("");
      setLoading(true);
      try {
        const hasCpf = isCpfOk(cpfQ);
        const data = await runFetch(hasCpf ? cpfQ : "", !hasCpf ? contratoQ : "");
        if (cancel) return;

        const parsed = parsePayload(data, hasCpf ? cpfQ : "");
        setCpf(cpfQ);
        setContrato(contratoQ);
        setCliente({ nomeCliente: parsed.nomeCliente, cpfCliente: parsed.cpfCliente });
        setContratos(parsed.contratos);
        setLastPayload(data);

        prepararSession(data, hasCpf ? cpfQ : "", contratoQ);
      } catch (e) {
        if (!cancel) setMsg("Erro na consulta. Verifique a API/CORS.");
        console.error(e);
      } finally {
        if (!cancel) setLoading(false);
      }
    })();

    return () => { cancel = true; };
  }, []); // mount only

  const consultarAqui = async () => {
    setMsg("");
    const cpfDigits = onlyDigits(cpf);
    const hasCpf = isCpfOk(cpfDigits);
    const contratoText = (contrato || "").trim();
    const hasContrato = contratoText.length > 0;

    if (!hasCpf && !hasContrato) {
      setMsg("Preencha CPF válido (11 dígitos) ou informe um Nº de contrato.");
      return;
    }

    setLoading(true);
    try {
      const data = await runFetch(hasCpf ? cpfDigits : "", hasContrato ? contratoText : "");
      const parsed = parsePayload(data, hasCpf ? cpfDigits : "");
      setCliente({ nomeCliente: parsed.nomeCliente, cpfCliente: parsed.cpfCliente });
      setContratos(parsed.contratos);
      setLastPayload(data);
      prepararSession(data, hasCpf ? cpfDigits : "", hasContrato ? contratoText : "");

      const url = buildUrl(PATHS.home, { cpf: hasCpf ? cpfDigits : undefined, contrato: hasContrato ? contratoText : undefined });
      go(url);
    } catch (e) {
      console.error(e);
      setMsg("Erro na consulta. Verifique a API/CORS.");
      setCliente(null); setContratos([]); setLastPayload(null);
    } finally { setLoading(false); }
  };

  const limpar = () => {
    setCpf(""); setContrato(""); setMsg(""); setCliente(null); setContratos([]); setLastPayload(null);
    const url = buildUrl(PATHS.home);
    go(url, { replace: true });
  };

  const openAcordos = (payload, e) => {
    e?.stopPropagation?.();
    try {
      sessionStorage.setItem("wizard.contrato", JSON.stringify(payload));
      localStorage.setItem("wizard.contrato", JSON.stringify(payload));
    } catch {}

    const cpfDigits = onlyDigits(cliente?.cpfCliente || "");
    const hasCpf = isCpfOk(cpfDigits);
    const contratoText = (payload?.numContrato || "").trim();

    const returnTo = buildUrl(PATHS.home, {
      cpf: hasCpf ? cpfDigits : undefined,
      contrato: contratoText ? contratoText : undefined,
    });

    pushReturn(returnTo);

    openStatic(PATHS.acordosHome, returnTo, {
      cpf: hasCpf ? cpfDigits : "",
      contrato: contratoText || "",
      from: "home",
    });
  };

  const openOriginais = (payload, e) => {
    e?.stopPropagation?.();
    try {
      sessionStorage.setItem("wizard.acordo", JSON.stringify(payload));
      sessionStorage.setItem("wizard.origem", "contrato-sem-acordo");
      localStorage.setItem("wizard.acordo", JSON.stringify(payload));
      localStorage.setItem("wizard.origem", "contrato-sem-acordo");
    } catch {}

    const cpfDigits = onlyDigits(cliente?.cpfCliente || "");
    const hasCpf = isCpfOk(cpfDigits);
    const contratoText = (payload?.numContrato || "").trim();

    const returnTo = buildUrl(PATHS.home, {
      cpf: hasCpf ? cpfDigits : undefined,
      contrato: contratoText ? contratoText : undefined,
    });

    pushReturn(returnTo);

    openStatic(PATHS.originais, returnTo, {
      cpf: hasCpf ? cpfDigits : "",
      contrato: contratoText || "",
      from: "home",
    });
  };

  const somaVal = contratos.reduce((s,c)=> s + toNum(c.valorContratado), 0);
  const somaSaldo = contratos.reduce((s,c)=> s + toNum(c.saldoAtual), 0);
  const juros = contratos.map(c=> Number(c.jurosMes||0)).filter(x=>x>0);
  const mediaJ = juros.length ? (juros.reduce((a,b)=>a+b,0)/juros.length) : 0;
  const ult = contratos.map(c=> c.dataUltVenc ? new Date(c.dataUltVenc) : null).filter(Boolean).sort((a,b)=> b-a)[0];
  const qtdAvisos = contratos.filter(c=> c.pagamentoParcial).length;

  return (
    <Card title="Consulta rápida (CPF / Contrato)" right={<span className="ui-tag">Atalho</span>}>
      <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
        <Field label="CPF" hint="11 dígitos ou deixe em branco se for usar contrato">
          <Input
            placeholder="000.000.000-00"
            inputMode="numeric"
            value={cpf}
            onChange={(e)=> setCpf(e.target.value)}
            onKeyDown={(e)=>{ if (e.key==="Enter") consultarAqui(); }}
          />
        </Field>

        <Field label="Nº de Contrato" hint="Opcional — se preenchido, aceita sem CPF">
          <Input
            placeholder="ex.: CTR-001234"
            value={contrato}
            onChange={(e)=> setContrato(e.target.value)}
            onKeyDown={(e)=>{ if (e.key==="Enter") consultarAqui(); }}
          />
        </Field>

        {/* AÇÕES — apenas 2 botões */}
        <div className="flex items-end gap-2">
          <PrimaryButton onClick={consultarAqui} disabled={loading} icon={Search}>
            {loading ? "Consultando..." : "Consultar"}
          </PrimaryButton>
          <Button onClick={limpar}>Limpar</Button>
        </div>
      </div>

      {msg && <div className="text-sm mt-2" style={{ color: "var(--warn)" }}>{msg}</div>}

      {cliente && (
        <div className="mt-4 ui-card" style={{ borderRadius: 12 }}>
          <div className="px-4 py-3 ui-border-b">
            <div className="flex items-center gap-2">
              <span className="ui-ink font-semibold">Cliente</span>
              <span className="ui-tag">{cliente.nomeCliente || "—"}</span>
              <span className="ui-tag">
                CPF {onlyDigits(cliente.cpfCliente||"").padStart(11,"0").replace(/(\d{3})(\d)/,"$1.$2").replace(/(\d{3})(\d)/,"$1.$2").replace(/(\d{3})(\d{1,2})$/,"$1-$2")}
              </span>
            </div>
          </div>

          <div className="p-4">
            {contratos.length > 0 ? (
              <>
                <div className="flex flex-wrap items-center gap-2 mb-3">
                  <span className="ui-tag">Total: <b style={{marginLeft:6}}>{contratos.length}</b></span>
                  <span className="ui-tag">Contratado: <b style={{marginLeft:6}}>{fmtBRL(somaVal)}</b></span>
                  <span className="ui-tag">Saldo: <b style={{marginLeft:6}}>{fmtBRL(somaSaldo)}</b></span>
                  <span className="ui-tag">Últ. venc.: <b style={{marginLeft:6}}>{ult? fmtDate(ult):"—"}</b></span>
                  <span className="ui-tag">Juros méd.: <b style={{marginLeft:6}}>{mediaJ? `${mediaJ.toFixed(2)}%`:"—"}</b></span>
                  {!!qtdAvisos && <span className="ui-tag">pagparc em {qtdAvisos}</span>}
                </div>

                <div className="table-wrap" role="region" aria-label="Contratos">
                  <table className="w-full table">
                    <thead>
                      <tr>
                        <th>Contrato</th>
                        <th>Carteira</th>
                        <th className="money">Valor contrat.</th>
                        <th className="money">Parcela</th>
                        <th>Nº</th>
                        <th>Pagas</th>
                        <th>Últ. venc.</th>
                        <th>Juros</th>
                        <th className="money"><strong>Saldo atual</strong></th>
                        <th>Aviso</th>
                        <th>Ação</th>
                      </tr>
                    </thead>
                    <tbody>
                      {contratos.map((c)=> {
                        const payload = {
                          nomeCliente: cliente?.nomeCliente, cpfCliente: cliente?.cpfCliente,
                          nomeCarteira: c.carteira || "", valorContratado: c.valorContratado,
                          ValorParcela: c.valorParcela, NumeroParcela: c.nParcelas, ParcelasPagas: c.parcelasPagas,
                          dataVencimento: c.dataUltVenc, numContrato: c.contrato, jurosMensais: c.jurosMes, saldoAtual: c.saldoAtual
                        };
                        const aviso = c.pagamentoParcial ? <span className="ui-tag">pagparc</span> : <span className="ui-muted">—</span>;
                        return (
                          <tr
                            key={c.contrato}
                            onClick={()=>openAcordos(payload)}
                            style={{cursor:"pointer"}}
                          >
                            <td>{c.contrato}</td>
                            <td>{c.carteira || "—"}</td>
                            <td className="money">{c.valorContratado? fmtBRL(c.valorContratado):"—"}</td>
                            <td className="money">{fmtBRL(c.valorParcela)}</td>
                            <td>{c.nParcelas || "—"}</td>
                            <td>{c.parcelasPagas || 0}</td>
                            <td>{c.dataUltVenc? fmtDate(c.dataUltVenc):"—"}</td>
                            <td>{c.jurosMes? `${Number(c.jurosMes).toFixed(2)}%`:"—"}</td>
                            <td className="money"><strong>{fmtBRL(c.saldoAtual)}</strong></td>
                            <td>{aviso}</td>
                            <td style={{whiteSpace:"nowrap"}}>
                              <button className="btn tiny" onClick={(e)=>openAcordos(payload,e)}>Acordos</button>{" "}
                              <button className="btn tiny primary" onClick={(e)=>openOriginais(payload,e)}>Originais</button>
                            </td>
                          </tr>
                        );
                      })}
                    </tbody>
                  </table>
                </div>
              </>
            ) : (
              <div className="ui-muted text-sm">Nenhum contrato encontrado.</div>
            )}
          </div>
        </div>
      )}
    </Card>
  );
}

/** ======= Dashboard (área logada) ======= */
function Dashboard({ onLogout }) {
  const [query, setQuery] = useState({ cnj: "", cpf: "", contract: "" });
  const [loading, setLoading] = useState(false);
  const [rows, setRows] = useState([]);
  const [open, setOpen] = useState(null);

  const doSearch = async () => {
    setLoading(true);
    try {
      if (DEMO_APP) {
        const rowsDemo = query.cnj ? mockRows.filter(r => r.cnj === query.cnj) : mockRows;
        setRows(rowsDemo); // mocks já têm partes
      } else {
        const params = new URLSearchParams();
        if (query.cnj) params.set("cnj", query.cnj);
        if (query.cpf) params.set("cpf", query.cpf);
        if (query.contract) params.set("contract", query.contract);
  
        const data = await apiGET(`${ENDPOINTS.search}?${params.toString()}`);
        const base = (data || []).map(r => ({
          // garante que temos um identificador "cnj"
          cnj: r.cnj || r.cnj_mask || r.process_cnj || r.numero || r.numero_cnj,
          partes: r.partes || "",
          foro: r.foro, vara: r.vara, sistema: r.sistema, situacao: r.situacao, ultimaMov: r.ultimaMov
        }));
        setRows(base);
        await enrichRowsWithPartiesPreviews(base, setRows);
      }
    } finally {
      setLoading(false);
    }
  };
  

  const onImport = async (file) => {
    if (DEMO_APP) return alert("Import (demo): simulando importação de CNJs.");
    const fd = new FormData();
    fd.append("file", file);
    const r = await fetch(ENDPOINTS.importCNJ, { method: "POST", body: fd, credentials: "include" });
    if (!r.ok) return alert("Falha no upload");
    alert("Importado! Indexando em segundo plano.");
  };

  return (
    <div className="min-h-screen" style={{ background:"var(--bg)" }}>
      <header className="sticky top-0 z-30 ui-soft ui-border" style={{ backdropFilter:"saturate(140%) blur(6px)" }}>
        <div className="max-w-6xl mx-auto px-4 py-3 flex items-center justify-between">
          <Brand />
          <div className="flex items-center gap-2">
            <Button icon={Upload} onClick={()=>document.getElementById("csvImport")?.click()}>Importar CNJs</Button>
            <input id="csvImport" type="file" accept=".csv" className="hidden" onChange={(e)=> e.target.files?.[0] && onImport(e.target.files[0])}/>
            <ThemeToggle />
            <Button onClick={onLogout}>Sair</Button>
          </div>
        </div>
      </header>

      <main className="max-w-6xl mx-auto p-4 space-y-4">
        {/* Consulta rápida: somente Consultar/Limpar */}
        <CpfShortcutCard />

        <Card title="Filtros" right={<Tag>Consulta</Tag>}>
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
            <Field label="Número do Processo (CNJ)" hint="0000000-00.0000.0.00.0000">
              <Input value={query.cnj} placeholder="0000000-00.0000.0.00.0000" onChange={(e)=> setQuery(q=>({...q, cnj: e.target.value}))}/>
            </Field>
            <Field label="CPF" hint="Somente números">
              <Input value={query.cpf} inputMode="numeric" placeholder="00000000000" onChange={(e)=> setQuery(q=>({...q, cpf: e.target.value}))}/>
            </Field>
            <Field label="Nº de Contrato" hint="ID interno">
              <Input value={query.contract} placeholder="ex.: CTR-001234" onChange={(e)=> setQuery(q=>({...q, contract: e.target.value}))}/>
            </Field>
          </div>
          <div className="pt-3 flex items-center gap-2">
            <PrimaryButton icon={Search} onClick={doSearch}>Buscar</PrimaryButton>
            <Button onClick={()=> setQuery({ cnj: "", cpf: "", contract: "" })}>Limpar</Button>
          </div>
        </Card>

        <ProcessesGrid rows={rows} loading={loading} onOpen={setOpen} onRefresh={doSearch}/>
      </main>

      <Drilldown proc={open} onClose={()=> setOpen(null)}/>
    </div>
  );
}

/* =================== App =================== */
export default function App() {
  const [logged, setLogged] = useState(false);
  const [loginEpoch, setLoginEpoch] = useState(0); // força remount do Dashboard
  const [authReady, setAuthReady] = useState(false); // evita redirect precoce

  // disponibiliza caminhos para as páginas estáticas
  useEffect(() => {
    localStorage.setItem("paths.acordos", PATHS.acordosHome);
    localStorage.setItem("paths.refin", PATHS.refin);
    localStorage.setItem("paths.antecip", PATHS.antecip);
    localStorage.setItem("paths.originais", PATHS.originais);
    sessionStorage.setItem("paths.acordos", PATHS.acordosHome);
    sessionStorage.setItem("paths.refin", PATHS.refin);
    sessionStorage.setItem("paths.antecip", PATHS.antecip);
    sessionStorage.setItem("paths.originais", PATHS.originais);
  }, []);

  // bootstrap de autenticação
  useEffect(()=>{
    if (DEMO_APP) {
      const persisted = sessionStorage.getItem("demo.logged"); // "1" quando logado
      setLogged(AUTO_LOGIN_DEMO || persisted === "1");
      setAuthReady(true);
      return;
    }
    (async ()=>{
      try { await apiGET(ENDPOINTS.me); setLogged(true); }
      catch { setLogged(false); }
      finally { setAuthReady(true); }
    })();
  }, []);

  // não intercepta páginas estáticas (CPF/Acordos/Calculadoras/Escolha-Operacao)
  useEffect(() => {
    if (!authReady) return;
    const p = window.location.pathname;
    if (isStaticPath(p)) return;
    if (!logged && p !== PATHS.login) go(PATHS.login, { replace: true });
    if (logged && (p === BASE_PATH || p === `${BASE_PATH}/` || p === PATHS.login)) go(PATHS.home, { replace: true });
  }, [logged, authReady]);

  const handleLogout = async () => {
    try {
      sessionStorage.removeItem("demo.logged");
      sessionStorage.removeItem("spa.navStack");
      sessionStorage.removeItem("spa.returnTo");
      localStorage.removeItem("spa.returnTo");
    } catch {}
    setLogged(false);
    setLoginEpoch((n) => n + 1);
    go(PATHS.login, { replace: true });
  };

  return (
    <ThemeProvider>
      {logged
        ? <Dashboard key={`dash-${loginEpoch}`} onLogout={handleLogout}/>
        : <LoginView onLogged={()=> { setLogged(true); setLoginEpoch((n)=>n+1); go(PATHS.home, { replace:true }); }}/>}
    </ThemeProvider>
  );
}
