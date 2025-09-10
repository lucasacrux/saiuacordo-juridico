# SaiuAcordo Jurídico – Monorepo

Projeto monorepo com frontend React, APIs Node.js e serviço de raspagem/autenticação no TJSP, apoiado em Supabase e (opcionalmente) MySQL para módulos específicos.

- Apps e serviços:
  - saiuacordo-juridico-frontend: SPA React + Vite + Tailwind
  - saiuacordo-juridico-backend: API de app (login por CPF/CNPJ ou OAB/UF) e proxy para raspador
  - saiuacordo-juridico-raspado-backend: API de raspagem/autenticação real TJSP (Playwright) + persistência no Supabase
  - saiuacordo-juridico-chat: API de consulta a histórico de chat (MySQL) para relatórios e suporte operacional

- Principais integrações:
  - Supabase (auth/dados): tabelas de usuários e dados judiciais (processes, movements, process_parties, etc.)
  - Playwright (Chromium): login real no ESAJ TJSP com fluxo de OTP
  - MySQL (módulo chat): base existente com tabelas chat_message, chat_customer, chat_seller (nomenclaturas variáveis)

## Requisitos
- Node.js 18+ (ESM nativo, Fetch/Blob/FormData nativos no backend)
- NPM/Yarn/PNPM (preferência livre, o repo usa package-lock)
- Supabase (projeto + Service Role Key)
- Playwright (Chromium) – instalado automaticamente via `npx playwright install chromium` quando necessário
- MySQL 8+ (apenas para `saiuacordo-juridico-chat`)

## Estrutura do repositório
- saiuacordo-juridico-frontend
- saiuacordo-juridico-backend
- saiuacordo-juridico-raspado-backend
- saiuacordo-juridico-chat

Arquivos auxiliares na raiz (amostras, anotações e utilidades): `schemasupabase.json`, `tjsp_movs.py`, imagens de referência, etc.

## Variáveis de ambiente
As `.env` variam por serviço. Exemplos (resumo):

### saiuacordo-juridico-backend (.env)
- PORT: porta do app (default 8010)
- FRONT_ORIGINS: lista separada por vírgula de origens permitidas no CORS (dev: http://localhost:5173, http://localhost:5175)
- RASPADOR_URL: URL do backend raspado (default http://localhost:8000)
- SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY: credenciais do Supabase (apenas no backend)
- AUTH_SECRET: segredo para assinar JWT
- COOKIE_DOMAIN: domínio do cookie (em dev, deixar vazio)
- NODE_ENV: production | development
- (Opcional) DB_HOST/DB_PORT/DB_USER/DB_PASS/DB_NAME: se usar MySQL legado em `config/db.js`

### saiuacordo-juridico-raspado-backend (.env)
- PORT: porta do raspador (default 8000)
- FRONT_ORIGIN: origem para CORS (dev: http://localhost:5175)
- SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY: credenciais de acesso ao banco do Supabase
- AUTH_SECRET, COOKIE_DOMAIN: iguais às do app para validar/emitir cookies
- HEADLESS: 1 (default) ou 0 para abrir navegador
- PW_SLOWMO: atraso ms para debug
- TJSP_OTP_TIMEOUT_MS: tempo de espera pelo OTP (default 15000)
- TJSP_FLOW_TTL_MS: TTL do fluxo de autenticação
- Opcional: ENABLE_2FA_EMAIL=1 e variáveis MAIL_IMAP_HOST/PORT/SECURE, MAIL_IMAP_USER/PASS,
  MAIL_LOOKBACK_MINUTES, MAIL_OTP_FROM, MAIL_OTP_SUBJECT_RX e MAIL_OTP_BODY_RX para que o
  raspador leia o código 2FA via IMAP (no Gmail use host `imap.gmail.com`, porta 993 e uma
  senha de app)

### saiuacordo-juridico-chat/backend (.env)
- DB_HOST, DB_PORT, DB_USER, DB_PASSWORD, DB_NAME: conexão MySQL
- (Demais ajustes de CORS e porta conforme necessário)

Nunca faça commit de chaves sensíveis. Use `.env` e `.env.example` para referência.

## Como rodar em desenvolvimento
1) Raspador (porta 8000):
   - `cd saiuacordo-juridico-raspado-backend`
   - `npm install`
   - Configure `.env` (ver `.env.example`)
   - (Opcional) `npx playwright install chromium`
   - `npm start` (ou `node server.js`)

2) App Backend (proxy, porta 8010):
   - `cd saiuacordo-juridico-backend`
   - `npm install`
   - Configure `.env` com `RASPADOR_URL=http://localhost:8000`, `SUPABASE_*`, `AUTH_SECRET`
   - `npm start` (ou `node server.js`)

3) Frontend (porta 5173/5175):
   - `cd saiuacordo-juridico-frontend`
   - `npm install`
   - `npm run dev`
   - A SPA usa endpoints relativos a `/api`, servidos pelo backend do item 2

4) Chat API (se necessário):
   - `cd saiuacordo-juridico-chat/backend`
   - `npm install`
   - Configure `.env` com acesso ao MySQL
   - `node server.js`

## Visão geral de APIs
### saiuacordo-juridico-backend (proxy + auth)
- GET `/api/health`, GET `/api/_version`
- POST `/api/auth/login` (CPF/CNPJ OU OAB/UF + password) → cookie JWT `sa_auth`
- POST `/api/auth/logout`
- GET `/api/auth/me` (requireAuth)
- Proxy para raspador:
  - `/api/auth/tjsp/connect|otp|ping|status|resend`
  - `/api/processes/search`
  - `/api/processes/:cnj/details`
  - `/api/processes/:cnj/movements`
  - POST `/api/processes/import-csv` (multipart: `file`)

### saiuacordo-juridico-raspado-backend (raspagem + dados)
- Fluxo TJSP real via Playwright (connect → otp → ping/status)
- Persistência no Supabase (processes, movements, process_parties, ...)
- Endpoints de consulta: `search`, `details`, `movements`, `parties`, `import-csv`

### saiuacordo-juridico-chat (relatórios chat)
- GET `/api/ping`
- GET `/api/simple/count|rows`
- GET `/api/messages` com filtros (cpf | phone | connectedPhone) + intervalo `start,end`

Detalhes de cada rota estão em ARQUITECTURE.md.

## Segurança e privacidade
- JWT assinado com `AUTH_SECRET`; cookie `sa_auth` httpOnly, SameSite=Lax, Secure em produção
- CORS restrito a origens configuradas (ou livre em dev se não definido)
- Credenciais Supabase Service Role restritas ao backend
- Dados sensíveis (CPF/CNPJ/OAB) tratados como PII: evitar logs, mascarar quando possível

## Build e deploy
- Frontend: `npm run build` (Vite) gera artefatos estáticos
- Backends Node: containerizáveis; expõem portas configuráveis por `PORT`
- Variáveis de ambiente devem ser provisionadas no runtime

## Suporte
- Problemas e sugestões: abra uma Issue ou PR (ver CONTRIBUTING.md)

