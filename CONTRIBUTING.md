# Guia de Contribuição

Obrigado por contribuir com o SaiuAcordo Jurídico! Este guia descreve como configurar o ambiente, padrões de código, abertura de issues/PRs e boas práticas de segurança/privacidade.

## Como começar
- Leia o `README.md` e `ARQUITECTURE.md` para entender módulos e fluxos.
- Use Node.js 18+.
- Crie `.env` em cada serviço a partir dos exemplos (`.env.example`).
- Tenha um projeto Supabase (Service Role Key apenas no backend) e, se for trabalhar no módulo de chat, acesso a um MySQL.

## Fluxo de trabalho
- Branching: `main` estável; crie branches por feature/fix: `feat/descricao-curta`, `fix/area-bug`.
- Commits: siga Conventional Commits
  - `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `perf:`, `test:`, `build:`
- PRs: descreva motivação, mudanças, risco de regressão e passos de teste manual.
- Issues: inclua contexto, passos para reproduzir, resultados esperados/obtidos, logs relevantes sem PII.

## Padrões de código
- ESM e padrão Node 18+ nos backends.
- Lint do frontend: `npm run lint` em `saiuacordo-juridico-frontend`.
- Nomeação clara de variáveis (evite siglas obscuras), funções puras quando possível.
- Não exponha chaves/segredos em logs, erros ou commits.

## Testes e validação
- Frontend: smoke manual com os principais fluxos (login, conectar TJSP, busca, detalhes, import CSV).
- Backend app: verifique `/api/_version`, `/api/health`, e rotas `auth`/`processes` com token.
- Raspador: rodar fluxo `connect → otp → ping` em ambiente controlado (atenção a rate limit e PII).
- Chat: valide consultas com dataset não sensível e janelas de tempo pequenas.

## Segurança e privacidade
- Supabase Service Role Key apenas no backend e nunca no frontend.
- `AUTH_SECRET` forte e rotacionável; cookies httpOnly/SameSite/secure em produção.
- Reduza logs de dados pessoais (CPF/CNPJ/OAB). Prefira IDs internos.
- Não comite dumps, credenciais, cookies ou capturas de tela com dados sensíveis.

## Estilo de PR
- Checklist:
  - [ ] Atualizei `.env.example` se necessário
  - [ ] Descrevi mudanças e impacto (positivos e riscos)
  - [ ] Documentei endpoints/contratos em `ARQUITECTURE.md` (se aplicável)
  - [ ] Testei manualmente os fluxos críticos
  - [ ] Não inclui segredos/PII

## Releases
- Use `CHANGELOG.md` (Keep a Changelog). Tag semântica: MAJOR.MINOR.PATCH.

## Dúvidas
Abra uma issue com tag `question` ou descreva no PR. Obrigado por colaborar!

