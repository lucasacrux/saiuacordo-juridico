# Variáveis de Ambiente – Resumo

Esta página resume as variáveis usadas por cada serviço. Consulte também os `.env.example` nos diretórios.

## Backend APP (`saiuacordo-juridico-backend/.env.example`)
- PORT: porta HTTP (default 8010)
- FRONT_ORIGINS: lista de origens CORS (vírgulas)
- RASPADOR_URL: URL do raspador (default http://localhost:8000)
- NODE_ENV: development | production
- AUTH_SECRET: segredo do JWT/cookie (compartilhado com raspador)
- COOKIE_NAME: nome do cookie (default sa_auth)
- COOKIE_DOMAIN: domínio do cookie (vazio em dev, nunca localhost em produção)
- SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY: credenciais de acesso (somente backend)
- DB_HOST, DB_PORT, DB_USER, DB_PASS, DB_NAME: opcional (legado MySQL)

## Backend Raspado (`saiuacordo-juridico-raspado-backend/.env.example`)
- PORT: porta HTTP (default 8000)
- FRONT_ORIGIN: origem única CORS (dev: http://localhost:5175)
- NODE_ENV: development | production
- AUTH_SECRET, COOKIE_DOMAIN: iguais às do App
- HEADLESS: 1 (padrão) ou 0 (abre browser)
- PW_SLOWMO: atraso ms
- TJSP_OTP_TIMEOUT_MS: espera OTP (ms)
- TJSP_FLOW_TTL_MS: TTL de fluxo (ms)
- SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY: acesso ao banco (Service Role)
- DB_HOST, DB_PORT, DB_USER, DB_PASSWORD, DB_NAME: opcional (scripts/ingest)
- TJSP_USER, TJSP_PASSWORD, TJSP_2FA_EMAIL, TJSP_URL: opcionais para automação controlada
- PW_PERSIST_SESSION, PW_USER_DATA_DIR, PW_KEEP_OPEN, PW_STORAGE_STATE: debug/perfil do Chromium

## Chat API (`saiuacordo-juridico-chat/backend/.env.example`)
- DB_HOST, DB_PORT, DB_USER, DB_PASSWORD, DB_NAME: conexão MySQL
- PORT: porta HTTP (default 3001)

