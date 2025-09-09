// server.js (APP) — Login CPF/CNPJ ou OAB/UF + proxy p/ backend-raspado
import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import cookieParser from "cookie-parser";
import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import multer from "multer";
import { createClient } from "@supabase/supabase-js";

dotenv.config(); // <<< importante: carregar .env ANTES de ler process.env

const app = express();
app.set("trust proxy", 1); // ok em dev/proxy local

/* =================== Utils =================== */
const onlyDigits = (s) => String(s || "").replace(/\D/g, "");
const isDev = process.env.NODE_ENV !== "production";

/* =================== CORS (com credenciais) =================== */
// Origens padrão (Vite) em dev; pode sobrescrever com FRONT_ORIGINS
const DEFAULT_ORIGINS = ["http://localhost:5175", "http://localhost:5173"];
const ORIGINS_ENV = (process.env.FRONT_ORIGINS || process.env.FRONT_ORIGIN || "")
  .split(",")
  .map((s) => s.trim())
  .filter(Boolean);
const ALLOW_ALL_IN_DEV = ORIGINS_ENV.length === 0 && isDev;
const ALLOWED = ORIGINS_ENV.length ? ORIGINS_ENV : DEFAULT_ORIGINS;

const corsOrigin = (origin, cb) => {
  if (ALLOW_ALL_IN_DEV) return cb(null, true);
  if (!origin || ALLOWED.includes(origin)) return cb(null, true);
  return cb(new Error("Not allowed by CORS"));
};

app.use(
  cors({
    origin: corsOrigin,
    credentials: true,
  })
);
// Preflight com a MESMA lógica
app.options("*", cors({ origin: corsOrigin, credentials: true }));

app.use(cookieParser());
app.use(express.json({ limit: "2mb" }));
app.use(express.urlencoded({ extended: false }));
const upload = multer({ storage: multer.memoryStorage() });

/* =================== Auth compartilhada =================== */
const AUTH_SECRET = process.env.AUTH_SECRET || "dev-secret";
const COOKIE_NAME = process.env.COOKIE_NAME || "sa_auth";
const COOKIE_DOMAIN = process.env.COOKIE_DOMAIN || undefined; // undefined em dev

function signJWT(u, extras = {}) {
  return jwt.sign(
    {
      sub: u.id,
      oab: u.oab,
      uf: u.uf,
      role: u.role || "advogado",
      cpf: u.cpf,
      cnpj: u.cnpj,
      cpf_cnpj: u.cpf_cnpj,
      ...extras,
    },
    AUTH_SECRET,
    { expiresIn: "7d" }
  );
}
function setAuthCookie(res, token) {
  const base = {
    httpOnly: true,
    sameSite: "lax",
    secure: process.env.NODE_ENV === "production",
    path: "/",
  };
  const opts = { ...base };
  // NÃO force Domain=localhost. Em dev, deixe sem domain.
  if (process.env.COOKIE_DOMAIN && process.env.COOKIE_DOMAIN !== "localhost") {
    opts.domain = process.env.COOKIE_DOMAIN;
  }
  res.cookie(COOKIE_NAME, token, opts);
}

function getBearerFromReq(req) {
  const hdr = req.headers.authorization || "";
  const token =
    (req.cookies && req.cookies[COOKIE_NAME]) || hdr.replace(/^Bearer\s+/, "");
  return token || "";
}
function requireAuth(req, res, next) {
  const token = getBearerFromReq(req);
  try {
    req.user = jwt.verify(token, AUTH_SECRET);
    return next();
  } catch {
    return res.status(401).json({ error: "unauthorized" });
  }
}

if (isDev) {
  app.get("/api/_debug/cookies", (req, res) => {
    res.json({ cookies: req.cookies, bearer: getBearerFromReq(req) });
  });
}
/* =================== Supabase (Service Role no backend) =================== */
const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
if (!supabaseUrl || !supabaseKey) {
  console.warn(
    "[WARN] SUPABASE_URL ou SUPABASE_SERVICE_ROLE_KEY ausentes no .env"
  );
}
const supabase = createClient(supabaseUrl, supabaseKey);

/* =================== Config do backend-raspado (proxy alvo) =================== */
const RASPADOR_URL = (process.env.RASPADOR_URL || "http://localhost:8000")
  .toString()
  .replace(/\/+$/, "");
console.log("[APP] RASPADOR_URL =", RASPADOR_URL);

/* =================== Helper de proxy JSON =================== */
async function forwardJSON(req, res, targetURL, method = "GET", bodyObj) {
  const url = new URL(targetURL);
  // anexa query original
  Object.entries(req.query || {}).forEach(([k, v]) => {
    if (v != null) url.searchParams.set(k, String(v));
  });

  // monta headers sem colocar "undefined"
  const headers = {
    Authorization: `Bearer ${getBearerFromReq(req)}`,
  };
  if (bodyObj) headers["Content-Type"] = "application/json";

  const r = await fetch(url.toString(), {
    method,
    headers,
    body: bodyObj ? JSON.stringify(bodyObj) : undefined,
  });

  const text = await r.text();
  const ct = r.headers.get("content-type") || "application/json; charset=utf-8";
  res.status(r.status).set("Content-Type", ct).send(text);
}

/* =================== Health/Version =================== */
app.get("/api/health", (_req, res) => res.json({ ok: true }));
app.get("/api/_version", (_req, res) => {
  res.json({
    sig: "saiuacordo-app-v2",
    raspador: RASPADOR_URL,
    time: new Date().toISOString(),
  });
});

/* =================== Auth endpoints =================== */
// Quem sou eu
app.get("/api/auth/me", requireAuth, (req, res) => {
  res.json({ ok: true, user: req.user });
});

// Login: CPF/CNPJ OU OAB/UF
app.post("/api/auth/login", async (req, res) => {
  try {
    const { cpfCnpj, oab, uf, password } = req.body || {};
    if (!password) return res.status(400).json({ error: "missing credentials" });

    let userRow = null;
    let loginType = null;

    if (cpfCnpj) {
      const doc = onlyDigits(cpfCnpj);
      if (doc.length === 11) loginType = "cpf";
      else if (doc.length === 14) loginType = "cnpj";
      else return res.status(400).json({ error: "bad cpfCnpj" });

            // No schema atual, use apenas cpf_cnpj (apenas dígitos)
            const { data, error } = await supabase
             .from("users")
             .select("id, cpf_cnpj, oab, uf, role, password_hash")
             .eq("cpf_cnpj", doc)
             .limit(1)
             .maybeSingle();

             if (error || !data) {
                console.error("[auth/login] supabase error:", error);
                return res.status(401).json({ error: "invalid" });
              }
              userRow = data; // <<< necessário
} else if (oab && uf) {
      loginType = "oab";
      const oabDigits = onlyDigits(oab);
      const ufUp = String(uf).trim().toUpperCase();
      const { data, error } = await supabase
        .from("users")
        .select("id, cpf_cnpj, oab, uf, role, password_hash")
        .eq("oab", oabDigits)
        .eq("uf", ufUp)
        .limit(1)
        .maybeSingle();
        if (error || !data) {
             console.error("[auth/login] supabase error:", error);
             return res.status(401).json({ error: "invalid" });
           }
      userRow = data;
    } else {
      return res.status(400).json({ error: "missing id" });
    }

    if (!userRow) return res.status(401).json({ error: "invalid" });

    // compara hash (vários nomes possíveis)
    const passHash =
      userRow.password_hash ||
      userRow.passwordHash ||
      userRow.pass_hash ||
      userRow.hash ||
      "";
    const okPass = await bcrypt.compare(String(password), String(passHash));
    if (!okPass) return res.status(401).json({ error: "invalid" });

    // claims extras úteis
    const extra = {};
    
    if (userRow.cpf_cnpj) extra.cpf_cnpj = onlyDigits(userRow.cpf_cnpj);

    const token = signJWT(userRow, extra);
    setAuthCookie(res, token);

    return res.json({
      ok: true,
      type: loginType,
      user: {
        id: userRow.id,
        cpf_cnpj: userRow.cpf_cnpj || null,
        oab: userRow.oab || null,
        uf: userRow.uf || null,
        role: userRow.role || "advogado",
      },
    });
  } catch (e) {
    console.error(e);
    return res.status(500).json({ error: "internal" });
  }
});

// Logout
app.post("/api/auth/logout", (_req, res) => {
  const base = { path: '/' };

  // limpa sem domain
  res.clearCookie(COOKIE_NAME, base);
  // tenta limpar se já foi setado com Domain=localhost
  res.clearCookie(COOKIE_NAME, { ...base, domain: "localhost" });
  // tenta limpar se você configurou COOKIE_DOMAIN
  if (process.env.COOKIE_DOMAIN) {
    res.clearCookie(COOKIE_NAME, { ...base, domain: process.env.COOKIE_DOMAIN });
  }

  return res.json({ ok: true });
});

/* =================== Proxy p/ raspador: TJSP =================== */
// connect (POST)
app.post("/api/auth/tjsp/connect", requireAuth, async (req, res) => {
  await forwardJSON(
    req,
    res,
    `${RASPADOR_URL}/api/auth/tjsp/connect`,
    "POST",
    req.body
  );
});

// otp (POST)
app.post("/api/auth/tjsp/otp", requireAuth, async (req, res) => {
  await forwardJSON(
    req,
    res,
    `${RASPADOR_URL}/api/auth/tjsp/otp`,
    "POST",
    req.body
  );
});

// ping (GET e POST)
app.get("/api/auth/tjsp/ping", requireAuth, async (req, res) => {
  await forwardJSON(req, res, `${RASPADOR_URL}/api/auth/tjsp/ping`, "GET");
});
app.post("/api/auth/tjsp/ping", requireAuth, async (req, res) => {
  await forwardJSON(
    req,
    res,
    `${RASPADOR_URL}/api/auth/tjsp/ping`,
    "POST",
    req.body
  );
});

// status (GET)
app.get("/api/auth/tjsp/status", requireAuth, async (req, res) => {
  await forwardJSON(req, res, `${RASPADOR_URL}/api/auth/tjsp/status`, "GET");
});

// resend (POST) — opcional, o front chama se existir
app.post("/api/auth/tjsp/resend", requireAuth, async (req, res) => {
  await forwardJSON(
    req,
    res,
    `${RASPADOR_URL}/api/auth/tjsp/resend`,
    "POST",
    req.body
  );
});

/* =================== Proxy p/ raspador: processos =================== */
// search (GET)
app.get("/api/processes/search", requireAuth, async (req, res) => {
  await forwardJSON(req, res, `${RASPADOR_URL}/api/processes/search`, "GET");
});

// details (GET)
app.get("/api/processes/:cnj/details", requireAuth, async (req, res) => {
  const url = `${RASPADOR_URL}/api/processes/${encodeURIComponent(
    req.params.cnj
  )}/details`;
  await forwardJSON(req, res, url, "GET");
});

// movements (GET)
app.get("/api/processes/:cnj/movements", requireAuth, async (req, res) => {
  const url = `${RASPADOR_URL}/api/processes/${encodeURIComponent(
    req.params.cnj
  )}/movements`;
  await forwardJSON(req, res, url, "GET");
});

// import CSV (POST multipart)
app.post(
  "/api/processes/import-csv",
  requireAuth,
  upload.single("file"),
  async (req, res) => {
    if (!req.file) return res.status(400).json({ error: "missing file" });

    // Node >=18 tem FormData/Blob nativos
    const fd = new FormData();
    const blob = new Blob([req.file.buffer], {
      type: req.file.mimetype || "text/csv",
    });
    const filename = req.file.originalname || "cnjs.csv";
    fd.append("file", blob, filename);

    const r = await fetch(`${RASPADOR_URL}/api/processes/import-csv`, {
      method: "POST",
      headers: {
        Authorization: `Bearer ${getBearerFromReq(req)}`,
      },
      body: fd,
    });

    const text = await r.text();
    const ct =
      r.headers.get("content-type") || "application/json; charset=utf-8";
    res.status(r.status).set("Content-Type", ct).send(text);
  }
);

/* =================== Start =================== */
const PORT = process.env.PORT || 8010;
app.listen(PORT, () => {
  console.log(`APP on http://localhost:${PORT} (proxy -> ${RASPADOR_URL})`);
  if (ALLOW_ALL_IN_DEV) {
    console.log("CORS: DEV mode — any origin allowed");
  } else {
    console.log("CORS: allowed origins ->", ALLOWED.join(", "));
  }
});
