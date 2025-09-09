-- court_systems_fill_base_urls_v2.sql
-- Versão "safe": apenas UPDATE (sem INSERT), usando system_key canônico
-- Assim evita criar uma segunda linha priority=1 no mesmo tribunal.

-- ====== PJe ======
UPDATE court_systems SET base_url='https://pje.cloud.tjpe.jus.br', scraper_slug='pje', enabled=true
WHERE court='TJPE' AND system_key='PJe';

UPDATE court_systems SET base_url='https://pje.tjba.jus.br', scraper_slug='pje', enabled=true
WHERE court='TJBA' AND system_key='PJe';

UPDATE court_systems SET base_url='https://pje.tjce.jus.br', scraper_slug='pje', enabled=true
WHERE court='TJCE' AND system_key='PJe';

UPDATE court_systems SET base_url='https://www.tjes.jus.br/pje', scraper_slug='pje', enabled=true
WHERE court='TJES' AND system_key='PJe';

UPDATE court_systems SET base_url='https://www.tjpa.jus.br', scraper_slug='pje', enabled=true
WHERE court='TJPA' AND system_key='PJe';

UPDATE court_systems SET base_url='https://www.tjpb.jus.br/pje', scraper_slug='pje', enabled=true
WHERE court='TJPB' AND system_key='PJe';

UPDATE court_systems SET base_url='https://pje.tjpi.jus.br', scraper_slug='pje', enabled=true
WHERE court='TJPI' AND system_key='PJe';

UPDATE court_systems SET base_url='https://pje1g.tjrn.jus.br/pje', scraper_slug='pje', enabled=true
WHERE court='TJRN' AND system_key='PJe';

UPDATE court_systems SET base_url='https://www.tjro.jus.br/sistema-pje', scraper_slug='pje', enabled=true
WHERE court='TJRO' AND system_key='PJe';

UPDATE court_systems SET base_url='https://www.tjdft.jus.br/pje', scraper_slug='pje', enabled=true
WHERE court='TJDFT' AND system_key='PJe';

UPDATE court_systems SET base_url='https://tjrj.pje.jus.br/1g', scraper_slug='pje', enabled=true
WHERE court='TJRJ' AND system_key='PJe';

UPDATE court_systems SET base_url='https://pje.tjmg.jus.br', scraper_slug='pje', enabled=true
WHERE court='TJMG' AND system_key='PJe';

UPDATE court_systems SET base_url='https://pje.tjap.jus.br', scraper_slug='pje', enabled=true
WHERE court='TJAP' AND system_key='PJe';

UPDATE court_systems SET base_url='https://pje.tjma.jus.br', scraper_slug='pje', enabled=true
WHERE court='TJMA' AND system_key='PJe';

UPDATE court_systems SET base_url='https://pje.tjmt.jus.br', scraper_slug='pje', enabled=true
WHERE court='TJMT' AND system_key='PJe';

UPDATE court_systems SET base_url='https://pje.tjms.jus.br', scraper_slug='pje', enabled=true
WHERE court='TJMS' AND system_key='PJe';

UPDATE court_systems SET base_url='https://pje.tjto.jus.br', scraper_slug='pje', enabled=true
WHERE court='TJTO' AND system_key='PJe';

-- ====== eproc ======
UPDATE court_systems SET base_url='https://eproc1g.tjsc.jus.br', scraper_slug='eproc', enabled=true
WHERE court='TJSC' AND system_key='EPROC';

UPDATE court_systems SET base_url='https://eproc1g.tjrs.jus.br/eproc', scraper_slug='eproc', enabled=true
WHERE court='TJRS' AND system_key='EPROC';

UPDATE court_systems SET base_url='https://www.tjsp.jus.br/eproc', scraper_slug='eproc', enabled=true
WHERE court='TJSP' AND system_key='EPROC';

-- ====== Projudi ======
UPDATE court_systems SET base_url='https://projudi.tjpr.jus.br/projudi', scraper_slug='projudi', enabled=true
WHERE court='TJPR' AND system_key='PROJUDI';

UPDATE court_systems SET base_url='https://projudi.tjgo.jus.br', scraper_slug='projudi', enabled=true
WHERE court='TJGO' AND system_key='PROJUDI';

UPDATE court_systems SET base_url='https://projudi.tjrr.jus.br', scraper_slug='projudi', enabled=true
WHERE court='TJRR' AND system_key='PROJUDI';

-- ====== e-SAJ ======
UPDATE court_systems SET base_url='https://esaj.tjsp.jus.br', scraper_slug='esaj', enabled=true
WHERE court='TJSP' AND system_key='ESAJ';

UPDATE court_systems SET base_url='https://esaj.tjac.jus.br', scraper_slug='esaj', enabled=true
WHERE court='TJAC' AND system_key='ESAJ';

UPDATE court_systems SET base_url='https://consultasaj.tjam.jus.br', scraper_slug='esaj', enabled=true
WHERE court='TJAM' AND system_key='ESAJ';

UPDATE court_systems SET base_url='https://www2.tjal.jus.br', scraper_slug='esaj', enabled=true
WHERE court='TJAL' AND system_key='ESAJ';

-- ====== Limpando duplicatas por caixa (se houver) ======
-- Remove linhas duplicadas por variação de caixa do sistema, mantendo a canônica (EPROC, ESAJ, PJe, PROJUDI).
WITH canon AS (SELECT unnest(ARRAY['ESAJ','PJe','EPROC','PROJUDI']) AS key),
dups AS (
  SELECT a.ctid AS ctid_del
  FROM court_systems a
  JOIN court_systems b
    ON a.court=b.court
   AND lower(a.system_key)=lower(b.system_key)
   AND a.system_key<>b.system_key
  WHERE b.system_key IN (SELECT key FROM canon)
    AND a.priority<>1 -- nunca removemos o default
)
DELETE FROM court_systems WHERE ctid IN (SELECT ctid_del FROM dups);

-- ====== Relatórios ======
-- 1) Quem ainda está sem base_url no default:
-- SELECT cs.court, cs.system_key, cs.base_url
-- FROM court_systems cs
-- JOIN (
--   SELECT court, MIN(priority) AS min_p
--   FROM court_systems
--   WHERE enabled
--   GROUP BY court
-- ) d ON cs.court = d.court AND cs.priority = d.min_p
-- WHERE (cs.base_url IS NULL OR cs.base_url = '');

-- 2) Checar que há exatamente 1 default por tribunal:
-- SELECT court, COUNT(*) AS defaults
-- FROM court_systems
-- WHERE priority = 1
-- GROUP BY court
-- HAVING COUNT(*) <> 1;
