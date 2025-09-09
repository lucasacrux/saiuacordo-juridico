# SaiuAcordo — Progresso & Guia de Testes do Login TJSP (via Playwright)

> **Status geral:** conseguimos padronizar a autenticação (cookie `sa_auth`), separar APP x RASPADO, estabilizar o preenchimento de usuário/senha no TJSP e abrir a tela de OTP com keep‑alive opcional. O ponto aberto é a etapa do **OTP**: ao digitar o código pelo navegador, a sessão encerra em vez de completar o login.

---

## ✅ O que já evoluímos

1. **Dois backends convivendo com o mesmo cookie/JWT**
   - **APP (porta 8010)**: login por **CPF/CNPJ + senha** (com supabase), emite cookie `sa_auth` (HTTP‑Only).
   - **RASPADO (porta 8000)**: usa o **mesmo** cookie para proteger rotas e fazer a automação Playwright.
2. **Rota real de conexão ao TJSP**
   - `POST /api/auth/tjsp/connect`: abre o ESAJ, preenche **CPF/CNPJ** e **senha**, **envia o form** e **aguarda** campo de OTP.
   - Aceita credenciais do body **ou** do `.env` (`TJSP_USER`, `TJSP_PASSWORD`).
3. **Preenchimento robusto dos inputs**
   - `safeFillStrict()` evita o “teclado global” e previne sobrescrever o usuário ao digitar a senha.
   - `findLoginInputsTJSP()` procura **user e password no mesmo form**, inclusive dentro de **iframes**.
   - `clickLoginSmart()` prioriza o botão **do mesmo form** da senha antes de cair no `Enter`.
4. **Fluxo com OTP e controle de sessão**
   - **Mantemos** `browser/context/page` no backend, e devolvemos um `flowId` ao cliente.
   - Rotas auxiliares:
     - `POST /api/auth/tjsp/ping` → mantém o **flow vivo** (atualiza `lastPing`).
     - `GET  /api/auth/tjsp/status?flowId=...` → indica se o **campo OTP** segue visível.
     - `POST /api/auth/tjsp/otp` → injeta o **código**, confirma, salva **storageState** e encerra o flow.
   - TTL configurável: `TJSP_FLOW_TTL_MS` (default 30min).

---

## 🔌 Arquitetura ativa

- **Cookie/JWT**: `sa_auth` (HTTP‑Only), assinado com `AUTH_SECRET` (comum aos dois serviços).
- **Supabase**: usado para autenticação (APP) e para gravar `tjsp_storage_state_path` após o OTP.
- **Playwright** (RASPADO): abre ESAJ → preenche → envia → espera OTP → aplica OTP → salva sessão.

---

## 🔐 Endpoints relevantes (RASPADO — porta 8000)

- `GET  /api/health` → ping simples.
- `GET  /api/auth/me` → retorna claims do JWT (precisa do cookie ou `Authorization: Bearer`).
- `POST /api/auth/tjsp/connect`  
  Body **opcional** (usa `.env` se vazio):
  ```json
  { "user": "000.000.000-00", "pass": "SENHA_TJSP" }
  ```
  **Resposta (ex.):**
  ```json
  { "flowId":"…", "status":"awaiting_otp", "ttlMs":1800000 }
  ```
- `POST /api/auth/tjsp/ping` → `{ "flowId": "…" }` (mantém sessão viva).
- `GET  /api/auth/tjsp/status?flowId=…` → `{ alive, otpVisible, url }`.
- `POST /api/auth/tjsp/otp` → `{ "flowId":"…", "code":"123456" }` aplica OTP, salva **storageState**, encerra o navegador e apaga o flow.

---

## 🧪 Passo‑a‑passo para testar no PowerShell

> **Pré‑requisitos**: ambos serviços rodando (`npm start` no APP/8010 e no RASPADO/8000). `.env` do RASPADO com `TJSP_USER`, `TJSP_PASSWORD` válidos **ou** mandar no body.

### 1) Obter cookie/JWT do APP (porta 8010)

```powershell
# nova sessão
$S = New-Object Microsoft.PowerShell.Commands.WebRequestSession

# login APP (ajuste os dados para os do supabase)
Invoke-WebRequest -UseBasicParsing `
  -Uri http://localhost:8010/api/auth/login `
  -Method POST -ContentType "application/json" `
  -Body '{"cpfCnpj":"000.000.000-00","password":"SENHA_APP"}' `
  -WebSession $S | Out-Null

# extrair JWT do cookie sa_auth
$tok = ($S.Cookies.GetCookies('http://localhost:8010') | ? { $_.Name -eq 'sa_auth' } | Select -First 1).Value
```

### 2) Abrir o fluxo no RASPADO (porta 8000)

```powershell
# usando credenciais do .env do RASPADO:
$r = Invoke-WebRequest -UseBasicParsing `
  -Uri http://localhost:8000/api/auth/tjsp/connect `
  -Method POST -ContentType "application/json" `
  -Body '{}' `
  -Headers @{ Authorization = "Bearer $tok" }

# alternativamente, mandar explicitamente no body:
# -Body '{"user":"000.000.000-00","pass":"SENHA_TJSP"}'

# captura o flowId
$flowId = ($r.Content | ConvertFrom-Json).flowId
$flowId
```

> Vai abrir o navegador, preencher login/senha e mostrar o campo de OTP no site do TJSP. **Não feche** a janela.

### 3) Manter o flow vivo (opcional, mas recomendado)

Em outro PowerShell, rode:

```powershell
# substitua $flowId e $tok
while ($true) {
  try {
    Invoke-WebRequest -UseBasicParsing `
      -Uri http://localhost:8000/api/auth/tjsp/ping `
      -Method POST -ContentType "application/json" `
      -Body (@{ flowId = $flowId } | ConvertTo-Json) `
      -Headers @{ Authorization = "Bearer $tok" } | Out-Null
  } catch {}
  Start-Sleep -Seconds 10
}
```

### 4) Digitar o OTP (duas opções)

**Opção A (via site do TJSP):** digite o código na janela aberta e clique **Confirmar/Validar**.  
**Opção B (via API):** cole o código vindo por e‑mail neste POST:

```powershell
Invoke-WebRequest -UseBasicParsing `
  -Uri http://localhost:8000/api/auth/tjsp/otp `
  -Method POST -ContentType "application/json" `
  -Body (@{ flowId = $flowId; code = "123456" } | ConvertTo-Json) `
  -Headers @{ Authorization = "Bearer $tok" }
```

**Se der certo:** resposta `{"ok":true,"status":"connected","storagePath":"…json"}` e o navegador fecha.

---

## 🧭 Como interpretar respostas de erro comuns

- `{"error":"invalid_credentials"}`  
  O ESAJ não abriu o campo de OTP (usuário/senha rejeitados). Verifique `TJSP_USER/TJSP_PASSWORD`.
- `{"error":"otp_not_detected"}`  
  Login enviou, mas **nenhum** campo de OTP apareceu dentro do timeout (`TJSP_OTP_TIMEOUT_MS`, default 15s). Pode ser:
  - Captcha/variação do fluxo;
  - Delay de carregamento da página;
  - Iframe diferente.
  Use `GET /api/auth/tjsp/status?flowId=…` para checar `otpVisible` e `url`.

---

## 🔍 Por que sua sessão fechou após digitar o OTP pelo navegador?

No código atual, **apenas** quando você chama `POST /api/auth/tjsp/otp` é que:
1) Injetamos o código programaticamente (ou você já digitou no site e chamamos só o “Confirmar”, tudo bem);  
2) **Salvamos** o `storageState` em disco e vinculamos ao usuário;  
3) **Fechamos** o navegador e removemos o flow.

Se você digitar **apenas no site** e **não** chamar a rota `/otp`, o backend **não** sabe que deve salvar a sessão; dependendo da página, o ESAJ pode redirecionar e encerrar o contexto (ou o TTL expira) sem persistir a sessão.  
**Solução:** mesmo digitando no site, dispare o `POST /api/auth/tjsp/otp` (com o mesmo `flowId`, e repetindo o código recebido). O handler é tolerante: se o input já estiver preenchido, ele só confirma, salva o storage e fecha limpo.

---

## 🧯 Troubleshooting rápido

1. **Certifique‑se do token certo** no RASPADO:  
   ```powershell
   Invoke-WebRequest -UseBasicParsing `
     -Uri http://localhost:8000/api/auth/me `
     -Headers @{ Authorization = "Bearer $tok" }
   ```
2. **Aumente o tempo de espera do OTP** (se a tela demora a aparecer):  
   `.env` no RASPADO → `TJSP_OTP_TIMEOUT_MS=45000`
3. **Mantenha o flow vivo** com `/ping` em segundo plano (loop a cada 10s).
4. **Cheque status** durante a espera:  
   ```powershell
   Invoke-WebRequest -UseBasicParsing `
     -Uri "http://localhost:8000/api/auth/tjsp/status?flowId=$flowId" `
     -Headers @{ Authorization = "Bearer $tok" }
   ```
5. **Valide credenciais**: logue manualmente no ESAJ com os mesmos dados.
6. **HEADLESS=0** no `.env` para visualizar o fluxo do Playwright.

---

## 🧭 Próximos passos sugeridos

- [ ] No **Front**: usar este fluxo com **popup modal** e inputs (`user`, `pass`, `otp`), chamando `/connect`, fazendo `/ping` e depois `/otp`.
- [ ] Persistir `storagePath` no supabase (já implementado) e usá‑lo no **scraper** via `context.storageState({ path })`.
- [ ] Exibir feedback claro ao usuário (status `awaiting_otp`, timer/TTL, botão “reenviar código”).

---

## 🧩 Variáveis de ambiente usadas (RASPADO)

```
AUTH_SECRET=...
FRONT_ORIGIN=http://localhost:5175

# Playwright
HEADLESS=0
PW_SLOWMO=0
TJSP_OTP_TIMEOUT_MS=15000
TJSP_FLOW_TTL_MS=1800000

# Credenciais opcionais do ESAJ (se não mandar no body)
TJSP_USER=000.000.000-00
TJSP_PASSWORD=SENHA_TJSP

# Supabase
SUPABASE_URL=...
SUPABASE_SERVICE_ROLE_KEY=...
```
