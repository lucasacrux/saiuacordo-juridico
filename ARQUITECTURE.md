# Arquitetura do Projeto

Este documento descreve a arquitetura lógica e técnica do monorepo SaiuAcordo Jurídico, relacionando módulos, fluxos, contratos de API, dados e decisões.

## Visão geral
- Frontend SPA (React + Vite) consome `/api/*`
- Backend App (Express) fornece autenticação do usuário final (CPF/CNPJ ou OAB/UF) e atua como proxy seguro para o Raspador
- Raspador (Express + Playwright) executa login real no ESAJ TJSP, gerencia fluxo de OTP e persiste dados no Supabase
- Módulo Chat (Express + MySQL) oferece relatórios e recuperação de conversas por CPF/telefone

```
[Browser SPA]──/api/*──>[Backend App]──proxy──>[Raspador TJSP]──>[Supabase]
                         └──(opcional) MySQL (legado/listagens locais)
[Ops/BI]──────/api/*───────────────────────────────────>[Chat API (MySQL)]
```

## Componentes
- saiuacordo-juridico-frontend: UI (login, conectar TJSP, busca, detalhes, importador CSV). Configurações de rotas estáticas, consumo de `/api`, máscaras IMask e ícones Lucide.
- saiuacordo-juridico-backend: API pública do app; CORS com credenciais; cookie `sa_auth`; `requireAuth` protege rotas; `forwardJSON` realiza proxy para o raspador incluindo `Authorization: Bearer` do usuário.
- saiuacordo-juridico-raspado-backend: API privada (rede interna) com Playwright; implementa helpers robustos p/ localizar inputs e lidar com iframes; grava dados no Supabase.
- saiuacordo-juridico-chat: API para acessar base MySQL heterogênea de chat (descobre colunas dinamicamente via INFORMATION_SCHEMA; normaliza payloads).

## Autenticação e sessão
- Login do app (backend): POST `/api/auth/login`
  - Entrada: `{ cpfCnpj?, oab?, uf?, password }` (um identificador obrigatório + senha)
  - Backend consulta `users` no Supabase (colunas: id, cpf_cnpj, oab, uf, role, password_hash)
  - Senha verificada com bcrypt (`bcrypt.compare`)
  - Emite JWT (7 dias) assinado por `AUTH_SECRET` e grava cookie httpOnly `sa_auth`
- Proteção: middleware `requireAuth` no app e raspador (compartilham `AUTH_SECRET`)
- Logout: POST `/api/auth/logout` (limpa cookie considerando variações de domínio)

## CORS e cookies
- Desenvolvimento: se `FRONT_ORIGINS` não definido, origens de Vite padrão (5173, 5175) são permitidas ou `ALLOW_ALL_IN_DEV` quando apropriado
- Produção: sempre definir `FRONT_ORIGINS` e `COOKIE_DOMAIN` (não use `localhost` como Domain)
- Cookies: `httpOnly`, `SameSite=Lax`, `Secure` em produção

## Dados e persistência
- Supabase (Postgres):
  - `users(id, cpf_cnpj, oab, uf, role, password_hash, ...)`
  - `processes(cnj, classe, assunto, foro, vara, juiz, distribution_at, control_code, area, valor_acao, partes?, ...)`
  - `movements(process_cnj, moved_at, description)`
  - `process_parties(process_cnj, role, name, document)`
  - `process_petitions(process_cnj, filed_at, type)`
  - `process_incidents(process_cnj, filed_at, type, text)`
  - `process_apensos(process_cnj, apensado_em, numero, classe, motivo, text)`
  - `process_hearings(process_cnj, scheduled_at?, date_only?, time_txt?, tipo, local, description)`
- MySQL (módulo chat):
  - `chat_message`, `chat_customer`, `chat_seller` com nomes/colunas variáveis

## Fluxos principais
1) Login (App):
   - Front → POST `/api/auth/login` → cookie `sa_auth`
   - Front → GET `/api/auth/me` → dados do usuário (id, oab, uf, cpf_cnpj, role)
2) Conectar TJSP (Raspador):
   - Front (logado) → POST `/api/auth/tjsp/connect` (user+pass+fatores) → inicia fluxo e aguarda OTP
   - Front → POST `/api/auth/tjsp/otp` (código) → sessão TJSP válida
   - Front → GET `/api/auth/tjsp/ping|status` (monitorar progresso)
3) Busca e detalhes de processos:
   - Front → GET `/api/processes/search?query=...` (proxy) → lista resumida
   - Front → GET `/api/processes/:cnj/details` (proxy) → header + extras (petições, incidentes, apensos, audiências)
   - Front → GET `/api/processes/:cnj/movements` (proxy) → movimentações normalizadas
   - Front → GET `/api/processes/:cnj/parties` (direto raspador) → normalização e dedup no front
4) Importar CSV de CNJ:
   - Front → POST `/api/processes/import-csv` (multipart `file`) → upsert em `processes`

## Contratos de API (resumo)
- POST `/api/auth/login` → `{ ok, type: "cpf|cnpj|oab", user: { id, cpf_cnpj?, oab?, uf?, role } }`
- GET `/api/auth/me` → `{ ok, user }`
- GET `/api/processes/search` → `[{ cnj, partes, foro, vara, sistema, situacao, ultimaMov }]`
- GET `/api/processes/:cnj/details` → `{ header: { cnj, classe, assunto, foro, vara, juiz, distribution_at, control_code, area, valor_acao, partes: [...] }, extras: { peticoes, incidentes, apensos, audiencias } }`
- GET `/api/processes/:cnj/movements` → `[{ data, movimentacao }]`
- GET `/api/processes/:cnj/parties` → `[{ role, name, document }]`
- POST `/api/processes/import-csv` → `{ ok, imported }`
- GET `/api/_version` → `{ sig, time, raspador? }`

## Tratamento de erros
- 400: parâmetros inválidos/faltantes
- 401: `unauthorized` (token ausente/expirado/inválido)
- 404: recursos não encontrados (ex.: CNJ inexistente)
- 500: falhas internas (logar com cuidado, sem PII)

## Observabilidade e debug
- Endpoints utilitários: `/api/health`, `/api/_version`; em dev: `/api/_debug/cookies`
- Playwright com `HEADLESS=0` e `PW_SLOWMO>0` para diagnósticos
- Salvar mínimas informações de diagnóstico, evitando PII

## Decisões de design
- JWT + cookie httpOnly para SSO entre app e raspador; segredo compartilhado por `AUTH_SECRET`
- Proxy central no app para consolidar CORS, cookies e controle de acesso
- Supabase como fonte de verdade para dados processuais raspados
- Front consome `/api` relativo para facilitar dev/prod reverso

## Segurança
- Service Role Key somente no backend; nunca no front
- Cookies `Secure` em produção; `SameSite=Lax`; evitar `Domain=localhost`
- Sanitização e minimização de logs; mascarar documentos quando possível

## Configuração por ambiente
- Dev: origens abertas controladas, cookies sem domínio explícito
- Homolog/Prod: origens explícitas, `COOKIE_DOMAIN` configurado, segredos gerenciados pelo orquestrador

