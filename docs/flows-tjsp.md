# Fluxos – Autenticação e TJSP

## Login no APP (CPF/CNPJ ou OAB/UF)
```mermaid
sequenceDiagram
  participant F as Frontend
  participant A as App Backend
  participant S as Supabase
  F->>A: POST /api/auth/login { cpfCnpj|oab, uf, password }
  A->>S: SELECT users (by cpf_cnpj ou oab/uf)
  S-->>A: { id, cpf_cnpj, oab, uf, role, password_hash }
  A->>A: bcrypt.compare(password, password_hash)
  A-->>F: Set-Cookie sa_auth=<JWT>; { ok, user }
  F->>A: GET /api/auth/me (cookie)
  A-->>F: { ok, user }
```

## Conexão TJSP (OTP)
```mermaid
sequenceDiagram
  participant F as Frontend
  participant A as App Backend
  participant R as Raspador
  participant T as ESAJ TJSP
  F->>A: POST /api/auth/tjsp/connect (Bearer cookie)
  A->>R: POST /api/auth/tjsp/connect (proxy + Bearer)
  R->>T: Navega/Preenche Credenciais (Playwright)
  R-->>F: { status: waiting_otp }
  F->>A: POST /api/auth/tjsp/otp { code }
  A->>R: POST /api/auth/tjsp/otp { code }
  R->>T: Submete OTP
  T-->>R: Sessão válida
  R-->>F: { status: connected }
```

## Buscar detalhes de processo
```mermaid
sequenceDiagram
  participant F as Frontend
  participant A as App Backend
  participant R as Raspador
  participant PG as Supabase
  F->>A: GET /api/processes/:cnj/details
  A->>R: GET /api/processes/:cnj/details (proxy)
  R->>PG: SELECT processes + tabelas normalizadas
  PG-->>R: registros
  R-->>F: { header, extras }
```

## Importar CSV de CNJs
```mermaid
sequenceDiagram
  participant F as Frontend
  participant A as App Backend
  participant R as Raspador
  participant PG as Supabase
  F->>A: POST /api/processes/import-csv (multipart file)
  A->>R: POST /api/processes/import-csv (forward)
  R->>R: Extrai CNJs por regex + upsert
  R->>PG: UPSERT processes(cnj)
  PG-->>R: OK
  R-->>F: { ok, imported }
```

