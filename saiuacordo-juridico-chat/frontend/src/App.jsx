/* src/App.jsx — UI com 3 abas (CPF, Cliente, Atendente) + lista de conversas e chat */
import { useMemo, useRef, useState, useEffect } from "react";

const onlyDigits = (s) => (s || "").replace(/\D+/g, "");
const KEYS_TEXT = ["message","text","body","conversation","content","caption","value","description","title"];

const TZ_FIX_MS = 3 * 60 * 60 * 1000; // 3 horas

const hhmm = (ts) => {
  if (!ts) return "";
  let s = String(ts).trim()
    .replace(/\.\d+$/, "")   // remove microsegundos
    .replace(" ", "T");      // compatível com Date
  const d = new Date(s);
  if (isNaN(d)) return String(ts);
  const fixed = new Date(d.getTime() - TZ_FIX_MS); // aplica -3h
  return fixed.toLocaleTimeString("pt-BR", { hour: "2-digit", minute: "2-digit" });
};
const defaultRange = () => {
  const now = new Date();
  const yyyyMMdd = now.toISOString().slice(0, 10);
  return { start: `${yyyyMMdd}T00:00`, end: `${yyyyMMdd}T23:59` };
};
const deepFindString = (obj, depth = 0) => {
  if (obj == null || depth > 6) return null;
  if (typeof obj === "string") return obj;
  if (typeof obj !== "object") return null;
  for (const k of KEYS_TEXT) {
    if (Object.prototype.hasOwnProperty.call(obj, k)) {
      const v = obj[k];
      if (typeof v === "string" && v.trim()) return v;
      const nested = deepFindString(v, depth + 1);
      if (nested) return nested;
    }
  }
  for (const k of Object.keys(obj)) {
    const nested = deepFindString(obj[k], depth + 1);
    if (nested) return nested;
  }
  return null;
};
const tryParseJson = (s) => {
  if (typeof s !== "string") return null;
  const t = s.trim();
  if (!t) return null;
  if (t.startsWith("{") || t.startsWith("[")) { try { return JSON.parse(t); } catch {} }
  try {
    const s2 = t
      .replace(/^'(.*)'$/s, "$1")
      .replace(/'([A-Za-z0-9_]+)'\s*:/g, "\"$1\":")
      .replace(/:\s*'([^']*)'/g, ": \"$1\"");
    if (s2.startsWith("{") || s2.startsWith("[")) return JSON.parse(s2);
  } catch {}
  return null;
};
const normalizeMsg = (m) => {
  let type = m?.type ?? null;
  let textStr = typeof m?.text === "string" ? m.text : null;
  let filename = m?.filename ?? null;
  let media_url = m?.media_url ?? null;
  let mime = m?.mime ?? null;
  if (!textStr && m?.text && typeof m.text === "object") {
    const found = deepFindString(m.text);
    if (found && found.trim()) { textStr = found; if (!type) type = "text"; }
  }
  if (!textStr && typeof m?.text === "string") {
    const parsed = tryParseJson(m.text);
    if (parsed) {
      const found = deepFindString(parsed);
      if (found && found.trim()) { textStr = found; if (!type) type = "text"; }
    }
  }
  if (!type && (m?.filename || m?.media_url)) { type = "attachment"; filename = filename || m?.filename; media_url = media_url || m?.media_url; }
  return {
    id: m.id, momment: m.momment, from_me: m.from_me, orig_type: m.orig_type ?? null,
    whoLabel: (m.from_me === 1 ? (m.seller_name || "Você") : (m.customer_name || "Cliente")),
    type: type || "text", text: textStr, filename, media_url, mime,
  };
};

export default function App() {
  const { start: start0, end: end0 } = defaultRange();

  const [mode, setMode] = useState("cpf"); // "cpf" | "client" | "attendant"
  const [cpf, setCpf] = useState("");
  const [phone, setPhone] = useState("");
  const [connectedPhone, setConnectedPhone] = useState("");
  const [start, setStart] = useState(start0);
  const [end, setEnd] = useState(end0);

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [page, setPage] = useState(1);

  // Chat data
  const [chatData, setChatData] = useState({ items: [], total: 0, pageSize: 500 });
  const chatItems = useMemo(() => (chatData.items || []).map(normalizeMsg), [chatData.items]);

  // Conversation list (left panel)
  const [convos, setConvos] = useState({ items: [], total: 0, pageSize: 50 });
  const [selectedId, setSelectedId] = useState(null);

  // paginação incremental da lista (lazy-load)
const [convosPage, setConvosPage] = useState(1);
const [convosLoadingMore, setConvosLoadingMore] = useState(false);
const sideListRef = useRef(null);

  // mini-abas da lista: 'all' (tudo), 'in' (última recebida por nós), 'out' (última enviada por nós)
const [convTab, setConvTab] = useState("all");

const convosFiltered = useMemo(() => {
  const items = convos.items || [];
  if (convTab === "all") return items;
  const want = convTab === "out" ? 1 : 0;
  return items.filter(c => (c.last_from_me ?? null) === want);
}, [convos.items, convTab]);

const convCounts = useMemo(() => {
  const items = convos.items || [];
  return {
    all: items.length,
    in:  items.filter(c => c.last_from_me === 0).length,
    out: items.filter(c => c.last_from_me === 1).length,
  };
}, [convos.items]);

  const cpfN   = onlyDigits(cpf);
  const phoneN = onlyDigits(phone);
  const connN  = onlyDigits(connectedPhone);

  const canSearchCPF   = mode === "cpf"       && cpfN   && start && end;
  const canSearchPhone = mode === "client"    && phoneN && start && end;
  const canSearchConn  = mode === "attendant" && connN  && start && end;

  async function fetchJson(url1, url2) {
    try {
      const r1 = await fetch(url1);
      if (r1.ok) return await r1.json();
      let msg = "Falha na API"; try { const j = await r1.json(); if (j?.error) msg = j.error; } catch {}
      throw new Error(msg);
    } catch (e1) {
      if (!url2) throw e1;
      const r2 = await fetch(url2);
      if (!r2.ok) { let msg = "Falha na API"; try { const j = await r2.json(); if (j?.error) msg = j.error; } catch {}; throw new Error(msg); }
      return await r2.json();
    }
  }

  async function loadChatByCpf(cpfParam, p = 1) {
    setLoading(true); setError("");
    try {
      const params = new URLSearchParams({ start, end, page: String(p), pageSize: String(chatData.pageSize || 500), cpf: cpfParam });
      const rel = `/api/messages?${params.toString()}`;
      const abs = `http://localhost:3001/api/messages?${params.toString()}`;
      const j = await fetchJson(rel, abs);
      setChatData(j || { items: [], total: 0, pageSize: 500 });
      setPage(p);
    } catch (e) { setError(String(e.message || e)); }
    finally { setLoading(false); }
  }

  async function loadChatByCustomer(customerId, p = 1) {
    setLoading(true); setError("");
    try {
      const params = new URLSearchParams({
        start,
        end,
        page: String(p),
        pageSize: String(chatData.pageSize || 500),
        customer_id: String(customerId),
      });
      const rel = `/api/messages/by-customer?${params.toString()}`;
      const abs = `http://localhost:3001/api/messages/by-customer?${params.toString()}`;
      const j = await fetchJson(rel, abs);
      setChatData(j || { items: [], total: 0, pageSize: 500 });
      setPage(p);
    } catch (e) {
      setError(String(e.message || e));
    } finally {
      setLoading(false);
    }
  }

  async function loadConvosByAttendant(p = 1, append = false) {
    const firstLoad = !append;
    if (firstLoad) {
      setLoading(true);
      setError("");
      setSelectedId(null);
      setChatData({ items: [], total: 0, pageSize: 500 });
    } else {
      setConvosLoadingMore(true);
    }
    try {
      const params = new URLSearchParams({
        start,
        end,
        page: String(p),
        pageSize: String(convos.pageSize || 50),
        connectedPhone: connN
      });
      const rel = `/api/conversations/by-attendant?${params.toString()}`;
      const abs = `http://localhost:3001/api/conversations/by-attendant?${params.toString()}`;
      const j = await fetchJson(rel, abs);
  
      if (append) {
        const merged = [...(convos.items || []), ...(j?.items || [])];
        setConvos({ ...j, items: merged });
        setConvosPage(p);
      } else {
        setConvos(j || { items: [], total: 0, pageSize: 50 });
        setConvosPage(p);
      }
  
      // auto abrir se só 1 conversa
      const list = append ? [...(convos.items || []), ...(j?.items || [])] : (j?.items || []);
      if (!append && list.length === 1) {
        const it = list[0];
        setSelectedId(it.customer_id);
        await loadChatByCustomer(it.customer_id, 1);
      }
    } catch (e) {
      setError(String(e.message || e));
    } finally {
      if (firstLoad) setLoading(false);
      else setConvosLoadingMore(false);
    }
  }

  async function loadConvosByPhone(p = 1, append = false) {
    const firstLoad = !append;
    if (firstLoad) {
      setLoading(true);
      setError("");
      setSelectedId(null);
      setChatData({ items: [], total: 0, pageSize: 500 });
    } else {
      setConvosLoadingMore(true);
    }
    try {
      const params = new URLSearchParams({
        start,
        end,
        page: String(p),
        pageSize: String(convos.pageSize || 50),
        phone: phoneN
      });
      const rel = `/api/conversations/by-phone?${params.toString()}`;
      const abs = `http://localhost:3001/api/conversations/by-phone?${params.toString()}`;
      const j = await fetchJson(rel, abs);
  
      if (append) {
        const merged = [...(convos.items || []), ...(j?.items || [])];
        setConvos({ ...j, items: merged });
        setConvosPage(p);
      } else {
        setConvos(j || { items: [], total: 0, pageSize: 50 });
        setConvosPage(p);
      }
  
      const list = append ? [...(convos.items || []), ...(j?.items || [])] : (j?.items || []);
      if (!append && list.length === 1) {
        const it = list[0];
        setSelectedId(it.customer_id);
        await loadChatByCustomer(it.customer_id, 1);
      }
    } catch (e) {
      setError(String(e.message || e));
    } finally {
      if (firstLoad) setLoading(false);
      else setConvosLoadingMore(false);
    }
  }

  async function onSearch(e) {
    e?.preventDefault?.();
    if (mode === "cpf" && canSearchCPF) {
      setConvos({ items: [], total: 0, pageSize: 50 });
      setSelectedId(cpfN);
      await loadChatByCpf(cpfN, 1);
    } else if (mode === "attendant" && canSearchConn) {
      await loadConvosByAttendant(1);
    } else if (mode === "client" && canSearchPhone) {
      await loadConvosByPhone(1);
    }
  }

  function Tab({ id, label }) {
    const active = mode === id;
    return (
      <button type="button" className={`tab ${active ? "active" : ""}`} onClick={() => setMode(id)}>
        {label}
      </button>
    );
  }

  function handleSideScroll(e) {
    const el = e.currentTarget;
    const nearBottom = el.scrollTop + el.clientHeight >= el.scrollHeight - 48;
    const hasMore = (convos.items?.length || 0) < (convos.total || 0);
    if (!nearBottom || !hasMore || convosLoadingMore || loading) return;
  
    const next = convosPage + 1;
    if (mode === "attendant") loadConvosByAttendant(next, true);
    else if (mode === "client") loadConvosByPhone(next, true);
  }

  return (
    <div className="app">
      <header className="topbar">
        <h1>Conversa</h1>

        <div className="tabs">
          <Tab id="cpf" label="CPF" />
          <Tab id="client" label="Cliente (phone)" />
          <Tab id="attendant" label="Atendente (connectedPhone)" />
        </div>

        <form onSubmit={onSearch} className="filters">
          <div className="col">
            {mode === "cpf" && (
              <label>CPF (somente dígitos)
                <input value={cpf} onChange={(e)=>setCpf(e.target.value)} placeholder="000.000.000-00" inputMode="numeric" maxLength={14}/>
              </label>
            )}
            {mode === "client" && (
              <label>Phone do cliente
                <input value={phone} onChange={(e)=>setPhone(e.target.value)} placeholder="55DDXXXXXXXXX" inputMode="numeric"/>
              </label>
            )}
            {mode === "attendant" && (
              <label>Connected Phone (atendente)
                <input value={connectedPhone} onChange={(e)=>setConnectedPhone(e.target.value)} placeholder="55DDXXXXXXXXX" inputMode="numeric"/>
              </label>
            )}
            <small className="hint">Escolha a aba e preencha o identificador.</small>
          </div>

          <div className="col">
            <label>Início
              <input type="datetime-local" value={start} onChange={(e)=>setStart(e.target.value)} />
            </label>
            <label>Fim
              <input type="datetime-local" value={end} onChange={(e)=>setEnd(e.target.value)} />
            </label>
            <button
              disabled={
                (mode==="cpf" && !canSearchCPF) ||
                (mode==="client" && !canSearchPhone) ||
                (mode==="attendant" && !canSearchConn) ||
                loading
              }
            >
              {loading ? "Buscando..." : "Buscar"}
            </button>
          </div>
        </form>
      </header>

      <div className={`body ${mode === "cpf" ? "one" : ""}`}>
        {/* Painel de conversas (aparece nas abas de atendente e cliente) */}
        {(mode === "attendant" || mode === "client") && (
          <aside className="side">
            <div className="sideHead">
  Conversas ({(convos.items?.length || 0)} / {convos.total || 0})
</div>
            <div className="miniTabs">
  <button
    type="button"
    className={`miniTab ${convTab === "all" ? "active" : ""}`}
    onClick={() => setConvTab("all")}
  >
    Total <span className="badge">{convCounts.all}</span>
  </button>
  <button
    type="button"
    className={`miniTab ${convTab === "in" ? "active" : ""}`}
    onClick={() => setConvTab("in")}
  >
    <span className="dot in" /> Recebido <span className="badge">{convCounts.in}</span>
  </button>
  <button
    type="button"
    className={`miniTab ${convTab === "out" ? "active" : ""}`}
    onClick={() => setConvTab("out")}
  >
    <span className="dot out" /> Enviado <span className="badge">{convCounts.out}</span>
  </button>
</div>
            <div className="sideList" ref={sideListRef} onScroll={handleSideScroll}>
            {convosFiltered?.map((c) => {

                  const active = selectedId === c.customer_id;

                  return (
                    <button
                      key={c.customer_id}
                      className={`conv ${active ? "active" : ""}`}
                      onClick={() => {
                        setSelectedId(c.customer_id);
                        loadChatByCustomer(c.customer_id, 1);
                      }}
                      title={c.cpf || ""}
                    >
                      <div className="convTitle">
  {c.customer_name || "(sem nome)"}{" "}
  {c.last_from_me === 0 && <span className="sidePill in">recebido</span>}
  {c.last_from_me === 1 && <span className="sidePill out">enviado</span>}
</div>
                      <div className="convSub">
                        <span>{c.cpf || "-"}</span>
                        <span> · </span>
                        <span>{c.message_count} msgs</span>
                        <span className="right">{hhmm(c.last_momment)}</span>
                      </div>
                    </button>
                  );
                })}

              {(!loading && (convos.items?.length || 0) === 0) && (
                <div className="sideEmpty">Nenhuma conversa no período.</div>
              )}
              {
              convosLoadingMore && (
  <div className="sideLoad">Carregando mais…</div>
)}
{((convos.items?.length || 0) >= (convos.total || 0)) && (convos.total > 0) && (
  <div className="sideLoad end">Fim da lista</div>
)}
            </div> {/* fecha .sideList */}
          </aside>
        )}

        {/* Chat */}
        <main className="chat">
          {chatItems.map((m) => {
            const outbound = (m.from_me === 1);
            return (
              <div key={m.id} className={`row ${outbound ? "right" : "left"}`}>
                <div className={`bubble ${outbound ? "sent" : "recv"}`}>
                  <div className="meta">
                    <span className="who">{m.whoLabel}</span>
                    {m.orig_type && <span className="pill">{m.orig_type}</span>}
                    <span className="time">{hhmm(m.momment)}</span>
                  </div>
                  {m.type === "text" ? (
                    <div className="text">{m.text || "(vazio)"}</div>
                  ) : (
                    <div className="attach">
                      [{m.type || "anexo"}] {m.filename || ""}
                      {m.media_url && <> — <a href={m.media_url} target="_blank" rel="noreferrer">abrir</a></>}
                      {m.text ? <div className="caption">{m.text}</div> : null}
                    </div>
                  )}
                </div>
              </div>
            );
          })}
          {(!loading && chatItems.length === 0) && <div className="card">Sem mensagens no período.</div>}
        </main>
      </div>

      <style>{`
        *{box-sizing:border-box}
        html,body,#root{height:100%;margin:0}
        .app{display:flex;flex-direction:column;height:100%;background:#F5F7FA;color:#1F2937}
        .topbar{padding:12px 16px;background:#fff;border-bottom:1px solid #e5e7eb;display:grid;gap:8px}
        .topbar h1{margin:0;font-size:18px;color:#070c7b}
        .tabs{display:flex;gap:8px}
        .tab{padding:6px 10px;border:1px solid #e5e7eb;border-radius:999px;background:#fff;cursor:pointer}
        .tab.active{background:#070c7b;color:#fff;border-color:#070c7b}

        .filters{display:grid;grid-template-columns:1fr 1fr;gap:16px;align-items:end}
        .filters .col{display:grid;gap:8px}
        .filters label{display:grid;gap:6px;font-size:12px;color:#6B7280}
        .filters input{padding:8px 10px;border:1px solid #e5e7eb;border-radius:8px;background:#fff}
        .filters button{height:36px;padding:0 14px;background:#0B5ED7;color:#fff;border:0;border-radius:10px;cursor:pointer}
        .filters button[disabled]{opacity:.6;cursor:not-allowed}
        .hint{color:#6B7280}

        .body{flex:1;display:grid;grid-template-columns:300px 1fr;gap:0;min-height:0}
        .body.one{grid-template-columns:1fr;}  /* CPF ocupa toda a largura */
        .side{border-right:1px solid #e5e7eb;background:#fff;display:flex;flex-direction:column;min-width:0}
        * Sidebar mais larga e estável */
.side{width:340px; min-width:300px;}

/* Mini-abas com wrap e não-vazamento */
.miniTabs{flex-wrap:wrap; gap:6px; padding:8px 10px; background:#fafbff; border-bottom:1px solid #e5e7eb; position:sticky; top:0; z-index:2;}
.miniTab{display:inline-flex; align-items:center; gap:6px; padding:6px 10px; border:1px solid #e5e7eb; border-radius:999px; background:#fff; color:#374151; font-size:12px; cursor:pointer;}
.miniTab.active{background:#111827; color:#fff; border-color:#111827;}
.miniTab .badge{margin-left:4px; padding:0 6px; border-radius:999px; font-weight:600; background:#f3f4f6; color:#374151; border:1px solid #e5e7eb;}
.miniTab.active .badge{background:#0b1220; color:#e5e7eb; border-color:#0b1220;}
.miniTab .dot{width:8px; height:8px; border-radius:999px; display:inline-block; border:1px solid #e5e7eb;}
.miniTab .dot.in{ background:#ecfdf5; border-color:#a7f3d0; }
.miniTab .dot.out{ background:#eef2ff; border-color:#c7d2fe; }

/* Itens da lista robustos */
.side .conv{display:block; width:100%; text-align:left; padding:10px 12px; border:0; border-bottom:1px solid #f3f4f6; background:#fff; cursor:pointer; overflow-wrap:anywhere;}
.side .conv:hover{background:#f9fafb}
.side .conv.active{background:#eef2ff}
.convTitle{font-size:14px; margin-bottom:4px; color:#111827; display:flex; align-items:center; gap:6px; flex-wrap:wrap;}
.convSub{font-size:12px; color:#6B7280; display:flex; gap:4px; align-items:center}
.convSub .right{margin-left:auto}
.sideEmpty{padding:12px; color:#6B7280; font-size:13px}

/* Loader/rodapé da lista */
.sideLoad{padding:10px 12px; text-align:center; color:#6B7280; font-size:12px}
.sideLoad.end{color:#9CA3AF}

/* Filtros – pequenas melhorias visuais (opcional) */
.filters input{transition:border-color .15s ease, box-shadow .15s ease}
.filters input:focus{outline:none; border-color:#93c5fd; box-shadow:0 0 0 3px rgba(59,130,246,.15)}
        .sideHead{padding:10px 12px;border-bottom:1px solid #e5e7eb;font-size:12px;color:#6B7280}
        .sideList{flex:1;overflow:auto}
        .side .conv{display:block;width:100%;text-align:left;padding:10px 12px;border:0;border-bottom:1px solid #f3f4f6;background:#fff;cursor:pointer}
        .side .conv:hover{background:#f9fafb}
        .side .conv.active{background:#eef2ff}
        .convTitle{font-size:14px;margin-bottom:4px;color:#111827}
        .convSub{font-size:12px;color:#6B7280;display:flex;gap:4px;align-items:center}
        .convSub .right{margin-left:auto}
        .sideEmpty{padding:12px;color:#6B7280;font-size:13px}

        .chat{overflow:auto;padding:12px;display:grid;gap:8px;background:#F5F7FA}
        .row{display:flex; align-items:flex-start;}
        .row.left{justify-content:flex-start}
        .row.right{justify-content:flex-end}
        .bubble{display:inline-block; max-width:min(80%, 720px);}
        .bubble{max-width:80%;padding:10px 12px;border-radius:14px;box-shadow:0 6px 18px rgba(9,30,66,.08)}
        .bubble.sent{background:#E8F1FF;border:1px solid #cfe3ff}
        .bubble.recv{background:#fff;border:1px solid #e5e7eb}
        .meta{display:flex;gap:8px;align-items:center;font-size:11px;color:#6B7280;margin-bottom:4px}
        .pill{background:#eef2ff;color:#3730a3;border:1px solid #c7d2fe;border-radius:999px;padding:1px 6px}
        .time{margin-left:auto;color:#6B7280}
        .text{white-space:pre-wrap;word-break:break-word;font-size:14px}
        .attach{font-size:13px;color:#374151}
        .attach .caption{margin-top:4px;white-space:pre-wrap}
        .miniTabs{
          display:flex; gap:6px; padding:8px 10px; background:#fafbff;
          border-bottom:1px solid #e5e7eb; position:sticky; top:0; z-index:2;
        }
        .miniTab{
          display:inline-flex; align-items:center; gap:6px;
          padding:6px 10px; border:1px solid #e5e7eb; border-radius:999px;
          background:#fff; color:#374151; font-size:12px; cursor:pointer;
          transition:filter .12s ease, background-color .12s ease;
        }
        .miniTab:hover{ filter:brightness(.98); }
        .miniTab.active{ background:#111827; color:#fff; border-color:#111827; }
        .miniTab .badge{
          margin-left:4px; padding:0 6px; border-radius:999px; font-weight:600;
          background:#f3f4f6; color:#374151; border:1px solid #e5e7eb;
        }
        .miniTab.active .badge{ background:#0b1220; color:#e5e7eb; border-color:#0b1220; }
        .miniTab .dot{
          width:8px; height:8px; border-radius:999px; display:inline-block;
          border:1px solid #e5e7eb;
        }
        .miniTab .dot.in{  background:#ecfdf5; border-color:#a7f3d0; } /* verde suave */
        .miniTab .dot.out{ background:#eef2ff; border-color:#c7d2fe; } /* indigo suave */
        
        .sidePill{
          margin-left:6px; font-size:10px; border-radius:999px; padding:2px 6px;
          border:1px solid transparent; vertical-align:middle;
        }
        .sidePill.in{  background:#ecfdf5; color:#065f46; border-color:#a7f3d0; }
        .sidePill.out{ background:#eef2ff; color:#3730a3; border-color:#c7d2fe; }
        
        .card{margin:12px;padding:10px 12px;background:#fff;border:1px solid #e5e7eb;border-radius:12px}

        @media (max-width:960px){
          .filters{grid-template-columns:1fr}
          .body{grid-template-columns:1fr}
          .side{order:2}
          .chat{order:1}
        }
      `}</style>
    </div>
  );
}
