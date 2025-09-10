# Documentação

Este diretório reúne diagramas e guias de arquitetura, fluxos e extensões planejadas (ex.: área de administração).

- architecture.md: visão detalhada da arquitetura, módulos e integrações.
- flows-tjsp.md: fluxos principais (auth/login, TJSP connect/OTP, busca/detalhes, import CSV) em diagramas Mermaid.
- admin-area.md: diretrizes para implementar a área de administração (RBAC, endpoints, telas, auditoria).
- env.md: resumo das variáveis por serviço e relação com os arquivos `.env.example`.

## Arquitetura (visão geral)
```mermaid
flowchart LR
  subgraph Frontend[SPA React]
    UI[Login/Consulta/Importador]
  end
  subgraph App[Backend APP (Express)]
    AAuth[Auth + Cookie JWT]
    AProxy[Proxy → Raspador]
  end
  subgraph Raspador[Backend Raspado (Express + Playwright)]
    TJSP[Login ESAJ + OTP]
    Persist[Persistência Supabase]
  end
  subgraph Data[Camadas de Dados]
    PG[(Supabase/Postgres)]
    My[(MySQL - Chat)]
  end
  subgraph ChatAPI[Chat API (Express)]
    Chat[Consultas/Relatórios]
  end

  UI -->|/api/*| App
  App -->|proxy| Raspador
  Raspador --> PG
  ChatAPI --> My
  UI -->|ops/bi| ChatAPI

  classDef infra fill:#eef,stroke:#88a
  classDef data fill:#efe,stroke:#8a8
  class Data data
  class App,ChatAPI,Raspador infra
```

