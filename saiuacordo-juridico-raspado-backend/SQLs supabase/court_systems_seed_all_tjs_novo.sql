
-- ===============================================================
-- Seeds: TODOS os TJs do Brasil em court_systems
-- ===============================================================
begin;
-- 1) Adiciona sistema 'UNKNOWN' (coringa)
insert into systems (key, name, website, notes)
values ('UNKNOWN', 'Desconhecido', null, 'Placeholder até confirmação')
on conflict (key) do nothing;

insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJAC', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJAL', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJAP', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJAM', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJBA', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJCE', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJDFT', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJES', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJGO', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJMA', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJMT', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJMS', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJMG', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJPA', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJPB', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJPR', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJPE', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJPI', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJRJ', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJRN', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJRS', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJRO', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJRR', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJSC', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJSE', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJSP', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;
insert into court_systems (court, system_key, priority, enabled, scraper_slug)
values ('TJTO', 'UNKNOWN', 1, true, null)
on conflict (court, system_key) do nothing;

-- 3) Overrides/upsserts confirmados

insert into court_systems (court, system_key, priority, enabled, base_url, scraper_slug, notes)
values ('TJSP', 'ESAJ', 1, true, 'https://esaj.tjsp.jus.br', 'esaj', 'TJSP principal em e-SAJ; há eproc em transição')
on conflict (court, system_key) do update set
  priority = excluded.priority,
  enabled = excluded.enabled,
  base_url = excluded.base_url,
  scraper_slug = excluded.scraper_slug,
  notes = excluded.notes;
update court_systems set priority = 2 where court = 'TJSP' and system_key = 'UNKNOWN';
insert into court_systems (court, system_key, priority, enabled, base_url, scraper_slug, notes)
values ('TJSP', 'EPROC', 2, true, 'https://www.tjsp.jus.br/eproc', 'eproc', 'eproc em transição (algumas competências)')
on conflict (court, system_key) do update set
  priority = excluded.priority,
  enabled = excluded.enabled,
  base_url = excluded.base_url,
  scraper_slug = excluded.scraper_slug,
  notes = excluded.notes;
update court_systems set priority = 2 where court = 'TJSP' and system_key = 'UNKNOWN';
insert into court_systems (court, system_key, priority, enabled, base_url, scraper_slug, notes)
values ('TJRJ', 'PJe', 1, true, 'https://tjrj.pje.jus.br/1g/login.seam', 'pje', 'TJRJ usa PJe no 1º Grau')
on conflict (court, system_key) do update set
  priority = excluded.priority,
  enabled = excluded.enabled,
  base_url = excluded.base_url,
  scraper_slug = excluded.scraper_slug,
  notes = excluded.notes;
update court_systems set priority = 2 where court = 'TJRJ' and system_key = 'UNKNOWN';
insert into court_systems (court, system_key, priority, enabled, base_url, scraper_slug, notes)
values ('TJMG', 'PJe', 1, true, 'https://pje.tjmg.jus.br', 'pje', 'TJMG usa PJe no 1º Grau (cível)')
on conflict (court, system_key) do update set
  priority = excluded.priority,
  enabled = excluded.enabled,
  base_url = excluded.base_url,
  scraper_slug = excluded.scraper_slug,
  notes = excluded.notes;
update court_systems set priority = 2 where court = 'TJMG' and system_key = 'UNKNOWN';
insert into court_systems (court, system_key, priority, enabled, base_url, scraper_slug, notes)
values ('TJSC', 'EPROC', 1, true, 'https://www.tjsc.jus.br/web/processo-eletronico-eproc', 'eproc', 'TJSC usa eproc (1º e 2º grau)')
on conflict (court, system_key) do update set
  priority = excluded.priority,
  enabled = excluded.enabled,
  base_url = excluded.base_url,
  scraper_slug = excluded.scraper_slug,
  notes = excluded.notes;
update court_systems set priority = 2 where court = 'TJSC' and system_key = 'UNKNOWN';
insert into court_systems (court, system_key, priority, enabled, base_url, scraper_slug, notes)
values ('TJRS', 'EPROC', 1, true, 'https://ppe.tjrs.jus.br', 'eproc', 'TJRS usa eproc (Portal do Processo Eletrônico)')
on conflict (court, system_key) do update set
  priority = excluded.priority,
  enabled = excluded.enabled,
  base_url = excluded.base_url,
  scraper_slug = excluded.scraper_slug,
  notes = excluded.notes;
update court_systems set priority = 2 where court = 'TJRS' and system_key = 'UNKNOWN';
commit;