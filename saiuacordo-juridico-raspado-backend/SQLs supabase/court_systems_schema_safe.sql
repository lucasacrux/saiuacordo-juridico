
-- ===============================================================
-- court_systems_schema_safe.sql
-- Versão sem DROP/TRUNCATE (evita alerta de operação destrutiva)
-- ===============================================================

-- Extensão para UUIDs (geralmente já ativa no Supabase)
create extension if not exists pgcrypto;

-- 1) Catálogo de sistemas
create table if not exists systems (
  key text primary key,
  name text not null,
  website text,
  notes text
);

insert into systems (key, name, website)
values
  ('ESAJ',   'e-SAJ',   'https://www.softplan.com.br/solucoes/e-saj/'),
  ('PJe',    'PJe',     'https://www.cnj.jus.br/pjecnj/'),
  ('EPROC',  'eproc',   'https://www.eproc.com.br/'),
  ('PROJUDI','Projudi', null)
on conflict (key) do nothing;

-- 2) Mapeamento Tribunal -> Sistemas
create table if not exists court_systems (
  id uuid primary key default gen_random_uuid(),
  court text not null,
  system_key text not null references systems(key) on update cascade on delete restrict,
  priority int not null default 1,
  enabled boolean not null default true,
  base_url text,
  scraper_slug text,
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (court, system_key)
);

create unique index if not exists uniq_court_systems_default
  on court_systems (court)
  where priority = 1;

-- Trigger utilitária (sem DROP):
create or replace function trg_set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at := now();
  return new;
end $$;

do $$
begin
  if not exists (
    select 1
    from pg_trigger t
    join pg_class c on c.oid = t.tgrelid
    where t.tgname = 'court_systems_set_updated_at'
      and c.relname = 'court_systems'
  ) then
    create trigger court_systems_set_updated_at
    before update on court_systems
    for each row execute function trg_set_updated_at();
  end if;
end $$;

-- 3) View de roteamento (mantemos CREATE OR REPLACE; não apaga dados)
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

-- 4) Função de backfill (idempotente)
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

-- Fim
