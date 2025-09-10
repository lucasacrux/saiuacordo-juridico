# Changelog

Formato baseado em Keep a Changelog e SemVer.

## [Unreleased]
- Documentação inicial completa (README, CONTRIBUTING, CODE_OF_CONDUT, ARQUITECTURE, PRD, PDD)
- Ajustes de CORS e cookies no backend app
- Melhoria de descrições de endpoints e fluxos no raspador

## [0.1.0] - 2025-09-10
### Adicionado
- Estrutura monorepo com 4 módulos (frontend, backend app, raspador, chat)
- Fluxo de login (CPF/CNPJ ou OAB/UF) com JWT + cookie httpOnly
- Proxy para backend raspado (TJSP) e rotas de processos
- Integração Supabase (processes, movements, process_parties, etc.)
- Frontend React + Vite com páginas de login/consulta e importador CSV
- Módulo de relatórios de chat (MySQL)

