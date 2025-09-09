
-- ===============================================================
-- Normalização de sistemas por tribunal (Supabase / Postgres)
-- Cria tabelas 'systems' e 'court_systems' e a view 'processes_router_vw'
-- Também inclui utilitários para backfill do campo processes.system
-- ===============================================================

-- Extensão para UUIDs (geralmente já ativa no Supabase)
create extension if not exists pgcrypto;

-- 1) Catálogo de sistemas (chave -> nome)
create table if not exists systems (
  key text primary key,
  name text not null,
  website text,
  notes text
);

-- Seeds dos sistemas principais (adicione outros se necessário)
insert into systems (key, name, website)
values
  ('ESAJ',   'e-SAJ',   'https://www.softplan.com.br/solucoes/e-saj/'),
  ('PJe',    'PJe',     'https://www.cnj.jus.br/pjecnj/'),
  ('EPROC',  'eproc',   'https://www.eproc.com.br/'),
  ('PROJUDI','Projudi', null)
on conflict (key) do nothing;

-- 2) Relação muitos-para-muitos: Tribunal (court) -> Sistemas
-- Ex.: court='TJSP', system_key='ESAJ', priority=1 (default), base_url, scraper_slug='esaj'
create table if not exists court_systems (
  id uuid primary key default gen_random_uuid(),
  court text not null,                         -- Ex.: 'TJSP','TJRJ','TRF-4','TRT-2','TRE-SP','STJ','STF'
  system_key text not null references systems(key) on update cascade on delete restrict,
  priority int not null default 1,             -- 1 = sistema preferencial (default) do tribunal
  enabled boolean not null default true,
  base_url text,
  scraper_slug text,                           -- nome do "driver" do scraper: 'esaj', 'pje', 'eproc', 'projudi', etc.
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (court, system_key)
);

-- Garante que cada tribunal tenha no máximo um "priority=1"
create unique index if not exists uniq_court_systems_default
  on court_systems (court)
  where priority = 1;

-- Trigger para manter updated_at
create or replace function trg_set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at := now();
  return new;
end $$;

drop trigger if exists court_systems_set_updated_at on court_systems;
create trigger court_systems_set_updated_at
before update on court_systems
for each row execute function trg_set_updated_at();

-- 3) Seeds mínimos e seguros (confirme e acrescente outros tribunais)
-- Mantemos apenas os que são 100% seguros aqui para evitar dados incorretos.
insert into court_systems (court, system_key, priority, enabled, base_url, scraper_slug, notes)
values
  ('TJSP', 'ESAJ', 1, true, 'https://esaj.tjsp.jus.br', 'esaj', 'Confirmado: TJSP usa e-SAJ como principal')
on conflict (court, system_key) do nothing;

-- 4) View de roteamento: escolhe o sistema derivado a partir do mapping,
--    com override pelo campo processes.system quando preenchido manualmente.
create or replace view processes_router_vw as
select
  p.*,
  coalesce(nullif(p.system, ''),
           (select cs.system_key
            from court_systems cs
            where cs.court = p.court and cs.enabled
            order by cs.priority asc, cs.created_at asc
            limit 1)) as derived_system_key,
  (select cs.scraper_slug
   from court_systems cs
   where cs.court = p.court and cs.enabled
   order by cs.priority asc, cs.created_at asc
   limit 1) as derived_scraper_slug,
  (select cs.base_url
   from court_systems cs
   where cs.court = p.court and cs.enabled
   order by cs.priority asc, cs.created_at asc
   limit 1) as derived_base_url
from processes p;

-- 5) Backfill utilitário: preenche processes.system quando estiver NULL,
--    com o sistema default do tribunal (priority=1).
create or replace function backfill_processes_system_from_mapping(batch_size int default 5000)
returns integer
language plpgsql
as $$
declare
  v_count integer := 0;
begin
  with cte as (
    select p.id, cs.system_key
    from processes p
    join court_systems cs
      on cs.court = p.court and cs.enabled and cs.priority = 1
    where (p.system is null or p.system = '')
    limit batch_size
  )
  update processes p
     set system = cte.system_key
  from cte
  where p.id = cte.id
  returning 1 into v_count;

  return coalesce(v_count, 0);
end $$;

-- 6) Consultas úteis
-- a) Próximos 500 processos por sistema derivado (para enfileirar no scraper)
--    select * from processes_router_vw
--    where derived_system_key = 'ESAJ' and (last_scraped_at is null)
--    order by created_at
--    limit 500;
--
-- b) Distribuição por sistema (derivado)
--    select derived_system_key, court, count(*) from processes_router_vw
--    group by 1,2 order by 1,2;

