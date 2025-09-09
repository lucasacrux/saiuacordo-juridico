
-- ===============================================================
-- court_systems_seed_all_tjs_fix.sql
-- Ajusta conflitos de unique index (court WHERE priority=1)
-- Estratégia: primeiro rebaixa o 'UNKNOWN' (ou qualquer outro) em priority=1,
-- depois faz UPSERT dos sistemas confirmados com priority=1.
-- ===============================================================
begin;
update court_systems
   set priority = 2
 where court = 'TJSP'
   and priority = 1
   and system_key <> 'ESAJ';
insert into court_systems (court, system_key, priority, enabled, base_url, scraper_slug, notes)
values ('TJSP', 'ESAJ', 1, true, 'https://esaj.tjsp.jus.br', 'esaj', 'TJSP principal em e-SAJ; eproc em transição')
on conflict (court, system_key) do update set
  priority = 1,
  enabled = true,
  base_url = excluded.base_url,
  scraper_slug = excluded.scraper_slug,
  notes = excluded.notes;
update court_systems
   set priority = 2
 where court = 'TJSP'
   and priority = 1
   and system_key <> 'EPROC';
insert into court_systems (court, system_key, priority, enabled, base_url, scraper_slug, notes)
values ('TJSP', 'EPROC', 1, true, 'https://www.tjsp.jus.br/eproc', 'eproc', 'eproc em transição (algumas competências)')
on conflict (court, system_key) do update set
  priority = 1,
  enabled = true,
  base_url = excluded.base_url,
  scraper_slug = excluded.scraper_slug,
  notes = excluded.notes;
update court_systems
   set priority = 2
 where court = 'TJRJ'
   and priority = 1
   and system_key <> 'PJe';
insert into court_systems (court, system_key, priority, enabled, base_url, scraper_slug, notes)
values ('TJRJ', 'PJe', 1, true, 'https://tjrj.pje.jus.br/1g/login.seam', 'pje', 'TJRJ PJe 1º Grau')
on conflict (court, system_key) do update set
  priority = 1,
  enabled = true,
  base_url = excluded.base_url,
  scraper_slug = excluded.scraper_slug,
  notes = excluded.notes;
update court_systems
   set priority = 2
 where court = 'TJMG'
   and priority = 1
   and system_key <> 'PJe';
insert into court_systems (court, system_key, priority, enabled, base_url, scraper_slug, notes)
values ('TJMG', 'PJe', 1, true, 'https://pje.tjmg.jus.br', 'pje', 'TJMG PJe 1º Grau')
on conflict (court, system_key) do update set
  priority = 1,
  enabled = true,
  base_url = excluded.base_url,
  scraper_slug = excluded.scraper_slug,
  notes = excluded.notes;
update court_systems
   set priority = 2
 where court = 'TJSC'
   and priority = 1
   and system_key <> 'EPROC';
insert into court_systems (court, system_key, priority, enabled, base_url, scraper_slug, notes)
values ('TJSC', 'EPROC', 1, true, 'https://www.tjsc.jus.br/web/processo-eletronico-eproc', 'eproc', 'TJSC eproc 1º/2º graus')
on conflict (court, system_key) do update set
  priority = 1,
  enabled = true,
  base_url = excluded.base_url,
  scraper_slug = excluded.scraper_slug,
  notes = excluded.notes;
update court_systems
   set priority = 2
 where court = 'TJRS'
   and priority = 1
   and system_key <> 'EPROC';
insert into court_systems (court, system_key, priority, enabled, base_url, scraper_slug, notes)
values ('TJRS', 'EPROC', 1, true, 'https://ppe.tjrs.jus.br', 'eproc', 'TJRS eproc')
on conflict (court, system_key) do update set
  priority = 1,
  enabled = true,
  base_url = excluded.base_url,
  scraper_slug = excluded.scraper_slug,
  notes = excluded.notes;
commit;