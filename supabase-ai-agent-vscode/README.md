# Supabase AI Agent (VS Code starter)

Este projeto mostra **como dar ao modelo acesso controlado ao seu banco (Supabase)** usando:
- **RPCs (funções Postgres)** *whitelistadas* (o modelo **não** executa SQL arbitrário).
- **Function calling** do OpenAI para o modelo solicitar uma ação.
- **Passo de aprovação humana** antes de qualquer alteração.
- Integração simples com **VS Code** (tarefas + debug).

## Passo a passo
1. Renomeie `.env.example` para `.env` e preencha as chaves.
2. Execute os SQLs em `sql/` no Supabase (SQL editor).
3. Instale deps e rode:
   ```bash
   npm i
   npm run dev    # compila em watch
   npm run agent  # inicia o agente/CLI
   ```
4. No terminal, escreva o que quer que o agente faça (ex.: *"atualize o e-mail do cliente 00000000-0000-0000-0000-000000000000 para teste@dominio.com"*).
5. O agente irá **propor** uma chamada RPC → você **aprova** ou **nega**.

> **Nunca** exponha `SUPABASE_SERVICE_ROLE` em front-end. Este projeto é **server-side**.
