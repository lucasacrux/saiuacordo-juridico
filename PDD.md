# PDD — Documento de Design do Projeto

## Objetivo
Detalhar decisões técnicas, contratos e implementação para o SaiuAcordo Jurídico.

## Stack
- Frontend: React 19 + Vite + Tailwind; IMask; Lucide Icons
- Backend App: Node 18 ESM + Express + CORS + cookie-parser + bcrypt + Supabase JS
- Raspador: Node 18 ESM + Express + Playwright (Chromium) + Supabase JS + zod + multer
- Chat: Node CJS + Express + mysql2 (descoberta dinâmica de esquema)

## Configuração
- Variáveis de ambiente por serviço (ver README)
- `AUTH_SECRET` compartilhado entre app e raspador
- CORS com credenciais e origens explicitadas em produção

## Autenticação
- Login via `/api/auth/login` (app) buscando usuário no Supabase `users`
- Hash de senha: `bcrypt.compare(password, password_hash)`
- JWT: `sub=id`, `role`, `oab`, `uf`, `cpf_cnpj`; expiração 7d; cookie httpOnly `sa_auth`
- Middlewares `requireAuth` idênticos no app e raspador (mesmo segredo)

## Fluxo TJSP (Playwright)
- Endpoints no raspador: `/api/auth/tjsp/connect`, `/otp`, `/ping`, `/status`, `/resend`
- `HEADLESS` e `PW_SLOWMO` controlam debug visual
- Heurísticas de input robustas: busca por label, `for`, xpath em iframes, fallback JS para setar `value`
- `OTP_WAIT_MS` e `FLOW_TTL_MS` controlam tempo de espera e validade do fluxo

## Dados (Supabase)
- Tabelas principais:
  - `processes(cnj PK, classe, assunto, foro, vara, juiz, distribution_at, control_code, area, valor_acao, partes JSON?)`
  - `movements(process_cnj FK, moved_at, description)`
  - `process_parties(process_cnj, role, name, document)`
  - `process_petitions(process_cnj, filed_at, type)`
  - `process_incidents(process_cnj, filed_at, type, text)`
  - `process_apensos(process_cnj, apensado_em, numero, classe, motivo, text)`
  - `process_hearings(process_cnj, scheduled_at?, date_only?, time_txt?, tipo, local, description)`
- Estratégia: leitura preferencial das tabelas normalizadas; campos legados do `processes` servem como fallback

## Contratos de API (detalhes)
- App Backend (proxy):
  - `forwardJSON(req, res, target, method, body)`
    - Copia querystring de `req`
    - `Authorization: Bearer <JWT do usuário>` vindo de header/cookie
    - Preserva `content-type` e repassa payload JSON
  - Rotas `/api/processes/*` apenas autenticadas (`requireAuth`)
- Raspador:
  - `/api/processes/search` → lista `{ cnj, partes, foro, vara, sistema, situacao, ultimaMov }`
  - `/api/processes/:cnj/details` → `header` e `extras` (vide ARQUITECTURE)
  - `/api/processes/:cnj/movements` → array `{ data, movimentacao }`
  - `/api/processes/:cnj/parties` → array `{ role, name, document }`
  - `import-csv` aceita `multipart/form-data` com `file` (csv), extrai CNJs por regex e `upsert` em `processes`

## Frontend
- Endpoints centralizados em `ENDPOINTS` e consumo com `fetch`
- Navegação SPA com suporte a páginas estáticas (prefixos preservados)
- Normalização de partes no cliente com deduplicação por `role|nome|doc`
- Enriquecimento assíncrono de grid com preview de partes (concorrência limitada)

## Erros e Resiliência
- Códigos HTTP: 400/401/404/500 padronizados
- Logs sem PII; erros do Supabase e Playwright com mensagens enxutas
- Reintentos moderados em steps de Playwright; tolerância a iframes e tabs

## Observabilidade
- `/api/health`, `/api/_version` em ambos os backends
- `/_debug/cookies` no app em dev
- Flags de debug do Playwright para diagnóstico

## Segurança
- Segredo JWT gerenciado externamente (não comitar)
- Cookie `Secure` em produção; `SameSite=Lax`
- Service Role Key somente no backend; políticas de banco de dados no Supabase

## Migrações e dados
- Evolução de schema preferencialmente por scripts SQL (pasta "SQLs supabase")
- Fallback de campos legados até migração completa (ex.: `partes` em `processes`)

## Implantação
- Cada serviço containerizável; variáveis via ambiente
- Reverse proxy unificando frontend estático e `/api/*` para o Backend App
- Raspador exposto somente internamente; App faz proxy

