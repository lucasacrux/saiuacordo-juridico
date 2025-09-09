// server.js — API de chat com:
// - /api/ping, /api/simple/*
// - /api/messages (parse de conteúdo text/audio/image/sticker/document)
// - /api/conversations/by-attendant  (lista clientes por connectedPhone)
// - /api/conversations/by-phone      (lista clientes por phone do cliente)
require("dotenv").config();
const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");

const app = express();
app.use(cors());
app.use(express.json());

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  port: Number(process.env.DB_PORT || 3306),
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
  dateStrings: true,
});

// ===== Utils
const onlyDigits = (s) => (s || "").replace(/\D+/g, "");
const qid = (id) => "`" + String(id).replace(/`/g, "``") + "`";
const col = (alias, name) => `${qid(alias)}.${qid(name)}`;
const KEYS_TEXT = ["message","text","body","conversation","content","caption","value","description","title"];

function safeParse(v) {
  if (v == null) return null;
  if (typeof v === "object") return v;
  if (typeof v !== "string") return null;
  const s = v.trim();
  if (!s) return null;
  try { return JSON.parse(s); } catch {}
  try {
    const s2 = s
      .replace(/^'(.*)'$/s, "$1")
      .replace(/'([A-Za-z0-9_]+)'\s*:/g, "\"$1\":")
      .replace(/:\s*'([^']*)'/g, ": \"$1\"");
    return JSON.parse(s2);
  } catch {}
  return null;
}
function deepFindString(obj, keys = KEYS_TEXT, depth = 0) {
  if (obj == null || depth > 6) return null;
  if (typeof obj === "string") return obj;
  if (typeof obj !== "object") return null;
  for (const k of keys) {
    if (Object.prototype.hasOwnProperty.call(obj, k)) {
      const v = obj[k];
      if (typeof v === "string" && v.trim()) return v;
      const nested = deepFindString(v, keys, depth + 1);
      if (nested) return nested;
    }
  }
  for (const k of Object.keys(obj)) {
    const nested = deepFindString(obj[k], keys, depth + 1);
    if (nested) return nested;
  }
  return null;
}
function extractMedia(obj) {
  if (!obj) return {};
  const url = deepFindString(obj, ["url","href","mediaUrl","downloadUrl","link","audioUrl","imageUrl","documentUrl","fileUrl"]);
  const filename = deepFindString(obj, ["fileName","filename","name","title"]);
  const mime = deepFindString(obj, ["mime","mime_type","mimetype","contentType","type"]);
  const caption = deepFindString(obj, ["caption","text","body","message","description"]);
  return { url, filename, mime, caption };
}
async function getColumns(table) {
  const [rows] = await pool.query(
    "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ?",
    [process.env.DB_NAME, table]
  );
  return new Set(rows.map(r => r.COLUMN_NAME));
}
const findFirst = (set, list) => list.find(x => set.has(x)) || null;
async function getFkColumn(localTable, refTable, refCol = "id") {
  const [rows] = await pool.query(
    `SELECT COLUMN_NAME
     FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
     WHERE TABLE_SCHEMA = ?
       AND TABLE_NAME = ?
       AND REFERENCED_TABLE_NAME = ?
       AND REFERENCED_COLUMN_NAME = ?
     LIMIT 1`,
    [process.env.DB_NAME, localTable, refTable, refCol]
  );
  return rows[0]?.COLUMN_NAME || null;
}
const normPhone = (a, f) =>
  `REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(${col(a,f)},'+',''),'(',''),')',''),'-',''),' ','')`;

// ===== Rotas básicas
app.get("/api/ping", (_req, res) => res.json({ ok: true }));

app.get("/api/simple/count", async (_req, res) => {
  try { const [r] = await pool.query("SELECT COUNT(*) AS total FROM `chat_message`"); res.json(r[0]); }
  catch (e) { res.status(500).json({ error: e.message, code: e.code, sql: e.sql }); }
});

app.get("/api/simple/rows", async (req, res) => {
  const limit = Math.min(Math.max(parseInt(req.query.limit || "10", 10), 1), 100);
  try { const [rows] = await pool.query("SELECT * FROM `chat_message` LIMIT ?", [limit]); res.json({ items: rows }); }
  catch (e) { res.status(500).json({ error: e.message, code: e.code, sql: e.sql }); }
});

// ===== /api/messages — conversa de um cliente (por cpf/phone/connectedPhone)
app.get("/api/messages", async (req, res) => {
  try {
    const { cpf, phone, connectedPhone, start, end } = req.query;
    if (!start || !end) return res.status(400).json({ error: "start e end são obrigatórios (YYYY-MM-DDTHH:mm)" });

    const startTs = String(start).replace("T", " ");
    const endTs   = String(end).replace("T", " ");

    const ids = [cpf, phone, connectedPhone].filter(Boolean);
    if (ids.length === 0) return res.status(400).json({ error: "informe cpf OU phone OU connectedPhone" });
    if (ids.length > 1)   return res.status(400).json({ error: "envie apenas um: cpf OU phone OU connectedPhone" });

    const msgCols  = await getColumns("chat_message");
    const custCols = await getColumns("chat_customer");
    const sellCols = await getColumns("chat_seller");

    const tsCol = findFirst(msgCols, ["momment","moment","created_at","createdAt","timestamp","datetime","date","time"]);
    if (!tsCol) return res.status(500).json({ error: "não achei coluna de tempo em chat_message (ex.: momment/moment)" });

    let customerFk = await getFkColumn("chat_message", "chat_customer", "id");
    if (!customerFk) {
      customerFk = findFirst(msgCols, [
        "customer_id","customerId","client_id","clientId","id_customer","fk_customer",
        "chat_customer_id","idClient","id_cliente"
      ]);
    }
    if (!customerFk) return res.status(400).json({ error: "Não encontrei coluna que relacione chat_message → chat_customer (ex.: customer_id/client_id)." });

    let sellerFk = await getFkColumn("chat_message", "chat_seller", "id");
    if (!sellerFk) {
      sellerFk = findFirst(msgCols, [
        "seller_id","sellerId","id_seller","fk_seller","chat_seller_id","idVendedor","id_vendedor"
      ]);
    }

    const fields = [
      `${col("m","id")} AS ${qid("id")}`,
      `${col("m", tsCol)} AS ${qid("momment")}`,
      msgCols.has("text")    ? `${col("m","text")}    AS ${qid("text_raw")}`    : `NULL AS ${qid("text_raw")}`,
      msgCols.has("audio")   ? `${col("m","audio")}   AS ${qid("audio_raw")}`   : `NULL AS ${qid("audio_raw")}`,
      msgCols.has("image")   ? `${col("m","image")}   AS ${qid("image_raw")}`   : `NULL AS ${qid("image_raw")}`,
      msgCols.has("sticker") ? `${col("m","sticker")} AS ${qid("sticker_raw")}` : `NULL AS ${qid("sticker_raw")}`,
      msgCols.has("document")
        ? `${col("m","document")} AS ${qid("document_raw")}`
        : (msgCols.has("documet") ? `${col("m","documet")} AS ${qid("document_raw")}` : `NULL AS ${qid("document_raw")}`),
      msgCols.has("type")    ? `${col("m","type")} AS ${qid("orig_type")}` : `NULL AS ${qid("orig_type")}`,
      msgCols.has("from_me") ? `${col("m","from_me")} AS ${qid("from_me")}` : `NULL AS ${qid("from_me")}`,
      msgCols.has("seller_chat_name") ? `${col("m","seller_chat_name")} AS ${qid("seller_chat_name_raw")}` : `NULL AS ${qid("seller_chat_name_raw")}`,
    ];

    let from = `FROM ${qid("chat_message")} ${qid("m")}
                LEFT JOIN ${qid("chat_customer")} ${qid("c")} ON ${col("c","id")} = ${col("m", customerFk)}`;
    if (custCols.has("name")) fields.push(`${col("c","name")} AS ${qid("customer_name")}`);
    if (custCols.has("cpf"))  fields.push(`${col("c","cpf")}  AS ${qid("cpf")}`);
    if (sellerFk) {
      from += ` LEFT JOIN ${qid("chat_seller")} ${qid("s")} ON ${col("s","id")} = ${col("m", sellerFk)}`;
      if (sellCols.has("chat_name")) fields.push(`${col("s","chat_name")} AS ${qid("seller_name")}`);
      if (sellCols.has("phone"))     fields.push(`${col("s","phone")}     AS ${qid("seller_phone")}`);
    } else {
      from += ` LEFT JOIN ${qid("chat_seller")} ${qid("s")} ON 1=0`;
      fields.push(`NULL AS ${qid("seller_name")}`, `NULL AS ${qid("seller_phone")}`);
    }

    const conds = [`${col("m", tsCol)} >= ? AND ${col("m", tsCol)} < ?`];
    const params = [startTs, endTs];

    if (cpf) {
      if (!custCols.has("cpf")) return res.status(400).json({ error: "Filtro por CPF indisponível: coluna c.cpf não existe." });
      conds.push(`REPLACE(REPLACE(REPLACE(${col("c","cpf")},'.',''),'-',''),'/','') = ?`);
      params.push(onlyDigits(cpf));
    } else if (phone) {
      const p = onlyDigits(phone);
      if (msgCols.has("phone")) {
        conds.push(`${normPhone("m","phone")} = ?`); params.push(p);
      } else if (msgCols.has("chatid")) {
        const chatidLocal = `SUBSTRING_INDEX(${col("m","chatid")},'@',1)`;
        const normChatid = `REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(${chatidLocal},'+',''),'(',''),')',''),'-',''),' ','')`;
        conds.push(`${normChatid} = ?`); params.push(p);
      } else if (custCols.has("phones")) {
        conds.push(`REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(${col("c","phones")},'+',''),'(',''),')',''),'-',''),' ','') LIKE ?`);
        params.push("%" + p + "%");
      } else {
        return res.status(400).json({ error: "Filtro por phone indisponível: não achei m.phone, m.chatid, nem c.phones." });
      }
    } else if (connectedPhone) {
      const p = onlyDigits(connectedPhone);
      if (msgCols.has("connectedPhone")) {
        conds.push(`${normPhone("m","connectedPhone")} = ?`); params.push(p);
      } else if (sellCols.has("phone") && sellerFk) {
        conds.push(`${normPhone("s","phone")} = ?`); params.push(p);
      } else {
        return res.status(400).json({ error: "Filtro por connectedPhone indisponível." });
      }
    }

    const where = conds.join(" AND ");
    const page = parseInt(req.query.page || "1", 10);
    const pageSize = Math.min(parseInt(req.query.pageSize || "500", 10), 1000);
    const offset = (page - 1) * pageSize;

    const selectSql = `
      SELECT ${fields.join(", ")}
      ${from}
      WHERE ${where}
      ORDER BY ${col("m", tsCol)} ASC
      LIMIT ? OFFSET ?;
    `;
    const countSql = `
      SELECT COUNT(*) AS total
      ${from}
      WHERE ${where};
    `;

    const [rows] = await pool.query(selectSql, [...params, pageSize, offset]);
    const [countRows] = await pool.query(countSql, params);

    // Normalização p/ front
    const items = rows.map((r) => {
      const tObj = safeParse(r.text_raw);
      const aObj = safeParse(r.audio_raw);
      const iObj = safeParse(r.image_raw);
      const sObj = safeParse(r.sticker_raw);
      const dObj = safeParse(r.document_raw);

      let type = null, text = null, filename = null, media_url = null, mime = null;

      if (tObj) {
        text = deepFindString(tObj, KEYS_TEXT);
        if (text && String(text).trim()) type = "text";
      }
      if (!type && aObj) { const m = extractMedia(aObj); type = "audio"; media_url = m.url; filename = m.filename; mime = m.mime; if (!text) text = m.caption || "(áudio)"; }
      if (!type && iObj) { const m = extractMedia(iObj); type = "image"; media_url = m.url; filename = m.filename; mime = m.mime; if (!text) text = m.caption || "(imagem)"; }
      if (!type && sObj) { const m = extractMedia(sObj); type = "sticker"; media_url = m.url; filename = m.filename; mime = m.mime; if (!text) text = m.caption || "(sticker)"; }
      if (!type && dObj) { const m = extractMedia(dObj); type = "document"; media_url = m.url; filename = m.filename; mime = m.mime; if (!text) text = m.caption || filename || "(documento)"; }

      if (!type) type = r.orig_type || "unknown";
      if (!text && typeof r.text_raw === "string" && r.text_raw.trim().length && r.text_raw.trim()[0] !== "{") {
        text = r.text_raw.trim();
      }
      const seller_name = r.seller_name || r.seller_chat_name_raw || null;

      return {
        id: r.id,
        momment: r.momment,
        from_me: r.from_me,
        orig_type: r.orig_type || null,
        customer_name: r.customer_name || null,
        cpf: r.cpf || null,
        seller_name,
        seller_phone: r.seller_phone || null,
        type,
        text: text || null,
        filename: filename || null,
        media_url: media_url || null,
        mime: mime || null
      };
    });

    res.json({ items, total: Number(countRows[0]?.total || 0), page, pageSize });
  } catch (e) {
    res.status(500).json({ error: e.message || "erro ao consultar", code: e.code, sql: e.sql });
  }
});

// ===== Listagem de conversas por ATENDENTE (connectedPhone) =====
app.get("/api/conversations/by-attendant", async (req, res) => {
  try {
    const { connectedPhone, start, end, page = "1", pageSize = "50" } = req.query;
    if (!connectedPhone) return res.status(400).json({ error: "connectedPhone é obrigatório" });
    if (!start || !end) return res.status(400).json({ error: "start e end são obrigatórios" });

    const startTs = String(start).replace("T", " ");
    const endTs   = String(end).replace("T", " ");
    const p = onlyDigits(connectedPhone);
    const pageN = Math.max(1, parseInt(page, 10));
    const sizeN = Math.min(200, Math.max(1, parseInt(pageSize, 10)));
    const offset = (pageN - 1) * sizeN;

    const msgCols  = await getColumns("chat_message");
    const custCols = await getColumns("chat_customer");
    const sellCols = await getColumns("chat_seller");

    const tsCol = findFirst(msgCols, ["momment","moment","created_at","createdAt","timestamp","datetime","date","time"]);
    if (!tsCol) return res.status(500).json({ error: "não achei coluna de tempo em chat_message" });

    let customerFk = await getFkColumn("chat_message", "chat_customer", "id");
    if (!customerFk) customerFk = findFirst(msgCols, ["customer_id","customerId","client_id","clientId","id_customer","fk_customer","chat_customer_id","idClient","id_cliente"]);
    if (!customerFk) return res.status(400).json({ error: "Sem relação chat_message→chat_customer" });

    let sellerFk = await getFkColumn("chat_message", "chat_seller", "id");
    if (!sellerFk) sellerFk = findFirst(msgCols, ["seller_id","sellerId","id_seller","fk_seller","chat_seller_id","idVendedor","id_vendedor"]);

    let from = `FROM ${qid("chat_message")} ${qid("m")}
                LEFT JOIN ${qid("chat_customer")} ${qid("c")} ON ${col("c","id")} = ${col("m", customerFk)}`;
    if (sellerFk) {
      from += ` LEFT JOIN ${qid("chat_seller")} ${qid("s")} ON ${col("s","id")} = ${col("m", sellerFk)}`;
    } else {
      from += ` LEFT JOIN ${qid("chat_seller")} ${qid("s")} ON 1=0`;
    }

    // filtro por connectedPhone (m.connectedPhone OU s.phone)
    const conds = [`${col("m", tsCol)} >= ? AND ${col("m", tsCol)} < ?`, `${col("c","id")} IS NOT NULL`];
    const params = [startTs, endTs];

    if (msgCols.has("connectedPhone")) {
      conds.push(`${normPhone("m","connectedPhone")} = ?`); params.push(p);
    } else if (sellCols.has("phone") && sellerFk) {
      conds.push(`${normPhone("s","phone")} = ?`); params.push(p);
    } else {
      return res.status(400).json({ error: "Não há m.connectedPhone nem s.phone" });
    }

    const where = conds.join(" AND ");

// Escolhe como extrair o "lado" da última mensagem
const lastExprA = msgCols.has("from_me")
  ? col("m2","from_me")
  : (msgCols.has("direction")
      ? `CASE WHEN UPPER(${col("m2","direction")}) IN ('SENT','OUT','OUTBOUND') THEN 1 ELSE 0 END`
      : "NULL");

// Subquery: pega o from_me da ÚLTIMA mensagem do cliente no intervalo
const lastFromMeSQL_A = `
  (SELECT ${lastExprA}
     FROM ${qid("chat_message")} ${qid("m2")}
    WHERE ${col("m2", customerFk)} = ${col("c","id")}
      AND ${col("m2", tsCol)} >= ? AND ${col("m2", tsCol)} < ?
    ORDER BY ${col("m2", tsCol)} DESC
    LIMIT 1
  ) AS ${qid("last_from_me")}
`;
    const selectSql = `
  SELECT ${col("c","id")} AS customer_id,
         ${custCols.has("name") ? col("c","name") : "NULL"} AS customer_name,
         ${custCols.has("cpf")  ? col("c","cpf")  : "NULL"} AS cpf,
         MAX(${col("m", tsCol)}) AS last_momment,
         MIN(${col("m", tsCol)}) AS first_momment,
         COUNT(*) AS message_count,
         ${lastFromMeSQL_A}
  ${from}
  WHERE ${where}
  GROUP BY ${col("c","id")}, ${custCols.has("name") ? col("c","name") : "customer_name"}, ${custCols.has("cpf") ? col("c","cpf") : "cpf"}
  ORDER BY last_momment DESC
  LIMIT ? OFFSET ?;
`;
    const countSql = `
      SELECT COUNT(DISTINCT ${col("c","id")}) AS total
      ${from}
      WHERE ${where};
    `;

    const [rows] = await pool.query(selectSql, [startTs, endTs, ...params, sizeN, offset]);
    const [countRows] = await pool.query(countSql, params);

    res.json({
      items: rows.map(r => ({
        customer_id: r.customer_id,
        customer_name: r.customer_name || null,
        cpf: r.cpf || null,
        first_momment: r.first_momment,
        last_momment: r.last_momment,
        message_count: Number(r.message_count || 0),
        last_from_me: (r.last_from_me == null ? null : Number(r.last_from_me)), // << ADICIONADO
      })),
      total: Number(countRows[0]?.total || 0),
      page: pageN,
      pageSize: sizeN
    });
  } catch (e) {
    res.status(500).json({ error: e.message || "erro ao consultar", code: e.code, sql: e.sql });
  }
});

// ===== Listagem de conversas por PHONE (cliente) =====
app.get("/api/conversations/by-phone", async (req, res) => {
  try {
    const { phone, start, end, page = "1", pageSize = "50" } = req.query;
    if (!phone) return res.status(400).json({ error: "phone é obrigatório" });
    if (!start || !end) return res.status(400).json({ error: "start e end são obrigatórios" });

    const startTs = String(start).replace("T", " ");
    const endTs   = String(end).replace("T", " ");
    const p = onlyDigits(phone);
    const pageN = Math.max(1, parseInt(page, 10));
    const sizeN = Math.min(200, Math.max(1, parseInt(pageSize, 10)));
    const offset = (pageN - 1) * sizeN;

    const msgCols  = await getColumns("chat_message");
    const custCols = await getColumns("chat_customer");

    const tsCol = findFirst(msgCols, ["momment","moment","created_at","createdAt","timestamp","datetime","date","time"]);
    if (!tsCol) return res.status(500).json({ error: "não achei coluna de tempo em chat_message" });

    let customerFk = await getFkColumn("chat_message", "chat_customer", "id");
    if (!customerFk) customerFk = findFirst(msgCols, ["customer_id","customerId","client_id","clientId","id_customer","fk_customer","chat_customer_id","idClient","id_cliente"]);
    if (!customerFk) return res.status(400).json({ error: "Sem relação chat_message→chat_customer" });

    let from = `FROM ${qid("chat_message")} ${qid("m")}
                LEFT JOIN ${qid("chat_customer")} ${qid("c")} ON ${col("c","id")} = ${col("m", customerFk)}`;

    const conds = [`${col("m", tsCol)} >= ? AND ${col("m", tsCol)} < ?`, `${col("c","id")} IS NOT NULL`];
    const params = [startTs, endTs];

    if (msgCols.has("phone")) {
      conds.push(`${normPhone("m","phone")} = ?`); params.push(p);
    } else if (msgCols.has("chatid")) {
      const chatidLocal = `SUBSTRING_INDEX(${col("m","chatid")},'@',1)`;
      const normChatid = `REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(${chatidLocal},'+',''),'(',''),')',''),'-',''),' ','')`;
      conds.push(`${normChatid} = ?`); params.push(p);
    } else if (custCols.has("phones")) {
      conds.push(`REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(${col("c","phones")},'+',''),'(',''),')',''),'-',''),' ','') LIKE ?`);
      params.push("%" + p + "%");
    } else {
      return res.status(400).json({ error: "Sem colunas compatíveis para phone (m.phone/m.chatid/c.phones)." });
    }

    const where = conds.join(" AND ");

    const lastExprP = msgCols.has("from_me")
  ? col("m2","from_me")
  : (msgCols.has("direction")
      ? `CASE WHEN UPPER(${col("m2","direction")}) IN ('SENT','OUT','OUTBOUND') THEN 1 ELSE 0 END`
      : "NULL");

        const lastFromMeSQL_P = `
      (SELECT ${lastExprP}
        FROM ${qid("chat_message")} ${qid("m2")}
        WHERE ${col("m2", customerFk)} = ${col("c","id")}
          AND ${col("m2", tsCol)} >= ? AND ${col("m2", tsCol)} < ?
        ORDER BY ${col("m2", tsCol)} DESC
        LIMIT 1
      ) AS ${qid("last_from_me")}
    `;
          const selectSql = `
        SELECT ${col("c","id")} AS customer_id,
              ${custCols.has("name") ? col("c","name") : "NULL"} AS customer_name,
              ${custCols.has("cpf")  ? col("c","cpf")  : "NULL"} AS cpf,
              MAX(${col("m", tsCol)}) AS last_momment,
              MIN(${col("m", tsCol)}) AS first_momment,
              COUNT(*) AS message_count,
              ${lastFromMeSQL_P}
        ${from}
        WHERE ${where}
        GROUP BY ${col("c","id")}, ${custCols.has("name") ? col("c","name") : "customer_name"}, ${custCols.has("cpf") ? col("c","cpf") : "cpf"}
        ORDER BY last_momment DESC
        LIMIT ? OFFSET ?;
      `;
    const countSql = `
      SELECT COUNT(DISTINCT ${col("c","id")}) AS total
      ${from}
      WHERE ${where};
    `;

    const [rows] = await pool.query(selectSql, [startTs, endTs, ...params, sizeN, offset]);
    const [countRows] = await pool.query(countSql, params);

    res.json({
      items: rows.map(r => ({
        customer_id: r.customer_id,
        customer_name: r.customer_name || null,
        cpf: r.cpf || null,
        first_momment: r.first_momment,
        last_momment: r.last_momment,
        message_count: Number(r.message_count || 0),
        last_from_me: (r.last_from_me == null ? null : Number(r.last_from_me)),
      })),
      total: Number(countRows[0]?.total || 0),
      page: pageN,
      pageSize: sizeN
    });
  } catch (e) {
    res.status(500).json({ error: e.message || "erro ao consultar", code: e.code, sql: e.sql });
  }
});

const port = Number(process.env.PORT || 3001);
// === NOVO: conversa por customer_id ===
app.get("/api/messages/by-customer", async (req, res) => {
  try {
    const { customer_id, start, end, page = "1", pageSize = "500" } = req.query;
    if (!customer_id) return res.status(400).json({ error: "customer_id é obrigatório" });
    if (!start || !end) return res.status(400).json({ error: "start e end são obrigatórios (YYYY-MM-DDTHH:mm)" });

    const startTs = String(start).replace("T", " ");
    const endTs   = String(end).replace("T", " ");
    const pageN   = Math.max(1, parseInt(page, 10));
    const sizeN   = Math.min(1000, Math.max(1, parseInt(pageSize, 10)));
    const offset  = (pageN - 1) * sizeN;

    const msgCols  = await getColumns("chat_message");
    const custCols = await getColumns("chat_customer");
    const sellCols = await getColumns("chat_seller");

    const tsCol = findFirst(msgCols, ["momment","moment","created_at","createdAt","timestamp","datetime","date","time"]);
    if (!tsCol) return res.status(500).json({ error: "não achei coluna de tempo em chat_message (ex.: momment/moment)" });

    let customerFk = await getFkColumn("chat_message", "chat_customer", "id");
    if (!customerFk) {
      customerFk = findFirst(msgCols, [
        "customer_id","customerId","client_id","clientId","id_customer","fk_customer",
        "chat_customer_id","idClient","id_cliente"
      ]);
    }
    if (!customerFk) return res.status(400).json({ error: "Sem relação chat_message → chat_customer" });

    let sellerFk = await getFkColumn("chat_message", "chat_seller", "id");
    if (!sellerFk) {
      sellerFk = findFirst(msgCols, [
        "seller_id","sellerId","id_seller","fk_seller","chat_seller_id","idVendedor","id_vendedor"
      ]);
    }

    const fields = [
      `${col("m","id")} AS ${qid("id")}`,
      `${col("m", tsCol)} AS ${qid("momment")}`,
      msgCols.has("text")    ? `${col("m","text")}    AS ${qid("text_raw")}`    : `NULL AS ${qid("text_raw")}`,
      msgCols.has("audio")   ? `${col("m","audio")}   AS ${qid("audio_raw")}`   : `NULL AS ${qid("audio_raw")}`,
      msgCols.has("image")   ? `${col("m","image")}   AS ${qid("image_raw")}`   : `NULL AS ${qid("image_raw")}`,
      msgCols.has("sticker") ? `${col("m","sticker")} AS ${qid("sticker_raw")}` : `NULL AS ${qid("sticker_raw")}`,
      msgCols.has("document")
        ? `${col("m","document")} AS ${qid("document_raw")}`
        : (msgCols.has("documet") ? `${col("m","documet")} AS ${qid("document_raw")}` : `NULL AS ${qid("document_raw")}`),
      msgCols.has("type")    ? `${col("m","type")} AS ${qid("orig_type")}` : `NULL AS ${qid("orig_type")}`,
      msgCols.has("from_me") ? `${col("m","from_me")} AS ${qid("from_me")}` : `NULL AS ${qid("from_me")}`,
      msgCols.has("seller_chat_name") ? `${col("m","seller_chat_name")} AS ${qid("seller_chat_name_raw")}` : `NULL AS ${qid("seller_chat_name_raw")}`,
    ];

    let from = `FROM ${qid("chat_message")} ${qid("m")}
                LEFT JOIN ${qid("chat_customer")} ${qid("c")} ON ${col("c","id")} = ${col("m", customerFk)}`;
    if (custCols.has("name")) fields.push(`${col("c","name")} AS ${qid("customer_name")}`);
    if (custCols.has("cpf"))  fields.push(`${col("c","cpf")}  AS ${qid("cpf")}`);
    if (sellerFk) {
      from += ` LEFT JOIN ${qid("chat_seller")} ${qid("s")} ON ${col("s","id")} = ${col("m", sellerFk)}`;
      if (sellCols.has("chat_name")) fields.push(`${col("s","chat_name")} AS ${qid("seller_name")}`);
      if (sellCols.has("phone"))     fields.push(`${col("s","phone")}     AS ${qid("seller_phone")}`);
    } else {
      from += ` LEFT JOIN ${qid("chat_seller")} ${qid("s")} ON 1=0`;
      fields.push(`NULL AS ${qid("seller_name")}`, `NULL AS ${qid("seller_phone")}`);
    }

    const conds = [`${col("m", tsCol)} >= ? AND ${col("m", tsCol)} < ?`, `${col("m", customerFk)} = ?`];
    const params = [startTs, endTs, Number(customer_id)];

    const where = conds.join(" AND ");
    const selectSql = `
      SELECT ${fields.join(", ")}
      ${from}
      WHERE ${where}
      ORDER BY ${col("m", tsCol)} ASC
      LIMIT ? OFFSET ?;
    `;
    const countSql = `
      SELECT COUNT(*) AS total
      ${from}
      WHERE ${where};
    `;

    const [rows] = await pool.query(selectSql, [...params, sizeN, offset]);
    const [countRows] = await pool.query(countSql, params);

    // normalização (igual à /api/messages)
    const items = rows.map((r) => {
      const tObj = safeParse(r.text_raw);
      const aObj = safeParse(r.audio_raw);
      const iObj = safeParse(r.image_raw);
      const sObj = safeParse(r.sticker_raw);
      const dObj = safeParse(r.document_raw);

      let type = null, text = null, filename = null, media_url = null, mime = null;

      if (tObj) {
        text = deepFindString(tObj, KEYS_TEXT);
        if (text && String(text).trim()) type = "text";
      }
      if (!type && aObj) { const m = extractMedia(aObj); type = "audio"; media_url = m.url; filename = m.filename; mime = m.mime; if (!text) text = m.caption || "(áudio)"; }
      if (!type && iObj) { const m = extractMedia(iObj); type = "image"; media_url = m.url; filename = m.filename; mime = m.mime; if (!text) text = m.caption || "(imagem)"; }
      if (!type && sObj) { const m = extractMedia(sObj); type = "sticker"; media_url = m.url; filename = m.filename; mime = m.mime; if (!text) text = m.caption || "(sticker)"; }
      if (!type && dObj) { const m = extractMedia(dObj); type = "document"; media_url = m.url; filename = m.filename; mime = m.mime; if (!text) text = m.caption || filename || "(documento)"; }

      if (!type) type = r.orig_type || "unknown";
      if (!text && typeof r.text_raw === "string" && r.text_raw.trim().length && r.text_raw.trim()[0] !== "{") {
        text = r.text_raw.trim();
      }
      const seller_name = r.seller_name || r.seller_chat_name_raw || null;

      return {
        id: r.id,
        momment: r.momment,
        from_me: r.from_me,
        orig_type: r.orig_type || null,
        customer_name: r.customer_name || null,
        cpf: r.cpf || null,
        seller_name,
        seller_phone: r.seller_phone || null,
        type,
        text: text || null,
        filename: filename || null,
        media_url: media_url || null,
        mime: mime || null
      };
    });

    res.json({ items, total: Number(countRows[0]?.total || 0), page: pageN, pageSize: sizeN });
  } catch (e) {
    res.status(500).json({ error: e.message || "erro ao consultar", code: e.code, sql: e.sql });
  }
});


app.listen(port, () => console.log(`API on http://localhost:${port}`));
