# PRD — Documento de Requisitos de Produto

## Contexto
O SaiuAcordo Jurídico visa acelerar o trabalho de escritórios e departamentos jurídicos ao consolidar login, consulta e organização de processos do TJSP (ESAJ), incluindo captura de partes, movimentações, petições, incidentes, apensos e audiências.

## Objetivos
- Reduzir tempo de consulta e organização de informações processuais
- Padronizar dados em modelo consistente (Supabase)
- Permitir importação em massa (CSV) e visualização organizada
- Possibilitar relatórios e análise (incluindo integração com módulo de chat)

## Stakeholders
- Advogados(as) e estagiários(as)
- Coordenadores(as) jurídicos
- Equipe de TI/Produto

## Métricas de sucesso (KPIs)
- Tempo médio de obtenção de detalhes completos de um processo
- Taxa de sucesso do login TJSP (incl. OTP)
- Latência média dos endpoints `/details` e `/movements`
- Número de processos importados por CSV por semana
- Satisfação do usuário (NPS interno)

## Escopo (MVP)
- Autenticação local (CPF/CNPJ ou OAB/UF) com senha
- Fluxo de conexão TJSP com OTP
- Busca e visualização de processos (resumo e detalhes)
- Movimentações, partes, petições, incidentes, apensos, audiências
- Importação de CNJs via CSV

## Fora de escopo (MVP)
- Edição de dados do processo direto no app (dados são raspados/sincronizados)
- Notificações push em produção (piloto/estudo pode existir)
- Multi-tribunais além de TJSP

## Requisitos funcionais
- RF1: Autenticar usuário com `{ cpfCnpj | (oab, uf) } + password` e manter sessão via cookie httpOnly
- RF2: Iniciar/acompanhar fluxo de login TJSP (connect, otp, ping/status)
- RF3: Buscar processos e obter detalhes, movimentos e partes
- RF4: Importar CSV de CNJs e criar/atualizar registros em `processes`
- RF5: Exibir dados de forma clara e responsiva no frontend

## Requisitos não funcionais
- Segurança: cookie httpOnly/SameSite; segredo JWT; Service Role no backend; minimização de PII em logs
- Desempenho: P95 de `/details` < 3s com dados já persistidos; `/search` < 2s
- Confiabilidade: reintentos moderados no raspador; TTL de fluxos e limpeza
- Observabilidade: endpoints de health/version; logs com correlação mínima

## Personas & Histórias (exemplos)
- Como Advogada, quero logar com meu CPF e senha para acessar meus processos
- Como Advogado, quero conectar no TJSP com OTP para que o sistema recupere dados automaticamente
- Como Coordenador, quero importar uma planilha de CNJs para acompanhar andamentos
- Critérios de aceitação: status HTTP corretos; dados completos/normalizados; feedback de erros claro

## Restrições e dependências
- Dependência de disponibilidade TJSP/ESAJ
- Supabase como camada de dados (esquema descrito em ARQUITECTURE.md)
- Playwright/Chromium com requisitos de runtime e rede

## Riscos
- Mudanças de DOM/fluxo no ESAJ invalidarem seletores/estratégia
- Rate limiting/bloqueio por múltiplas conexões simultâneas
- Sensibilidade de dados pessoais exige governança (LGPD)

## Roadmap (alto nível)
- v0.1: MVP (login local, fluxo TJSP, consultas, CSV)
- v0.2: Melhorias de UI/UX, caching incremental, ajustes de schema
- v0.3: Multi-tribunais (exploratória), alertas e integrações externas

