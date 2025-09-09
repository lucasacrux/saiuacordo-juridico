
-- court_systems_fill_base_urls.sql
-- Preenche/atualiza base_url e scraper_slug para sistemas padrão dos TJs.
-- Usa UPSERT (ON CONFLICT (court, system_key)) e mantém a prioridade atual.

-- ====== TJs com PJe ======
INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJPE','PJe','https://pje.cloud.tjpe.jus.br','pje', true) -- Fonte: portal TJPE
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJBA','PJe','https://pje.tjba.jus.br','pje', true) -- Fonte: portal TJBA
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJCE','PJe','https://pje.tjce.jus.br','pje', true) -- Fonte: portal TJCE
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJES','PJe','https://www.tjes.jus.br/pje','pje', true) -- Fonte: portal TJES
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJPA','PJe','https://www.tjpa.jus.br/PortalExterno/institucional/Portal-PJE/942-Apresentacao.xhtml','pje', true) -- Fonte: portal TJPA
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJPB','PJe','https://www.tjpb.jus.br/pje','pje', true) -- Fonte: portal TJPB
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJPI','PJe','https://pje.tjpi.jus.br','pje', true) -- Fonte: portal TJPI
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJRN','PJe','https://pje1g.tjrn.jus.br/pje','pje', true) -- Fonte: portal TJRN (1º grau)
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJRO','PJe','https://www.tjro.jus.br/sistema-pje','pje', true) -- Fonte: portal TJRO
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJDFT','PJe','https://www.tjdft.jus.br/pje','pje', true) -- Fonte: portal TJDFT
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJRJ','PJe','https://tjrj.pje.jus.br/1g','pje', true) -- Fonte: portal TJRJ (1º grau)
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJMG','PJe','https://pje.tjmg.jus.br','pje', true) -- Fonte: portal TJMG
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJAP','PJe','https://pje.tjap.jus.br','pje', true) -- Fonte: TJAP
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

-- ====== TJs com eproc ======
INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJSC','eproc','https://eproc1g.tjsc.jus.br','eproc', true) -- Fonte: TJSC
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJRS','eproc','https://eproc1g.tjrs.jus.br/eproc','eproc', true) -- Fonte: TJRS
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

-- (Opcional) TJSP também tem eproc paralelo em algumas competências
INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJSP','eproc','https://www.tjsp.jus.br/eproc','eproc', true) -- Fonte: TJSP
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

-- ====== TJs com Projudi ======
INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJPR','PROJUDI','https://projudi.tjpr.jus.br/projudi','projudi', true) -- Fonte: TJPR
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJGO','PROJUDI','https://projudi.tjgo.jus.br','projudi', true) -- Fonte: TJGO
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

-- RR utiliza Projudi (há PJe para algumas classes, mas Projudi é relevante)
INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJRR','PROJUDI','https://projudi.tjrr.jus.br','projudi', true) -- Fonte: TJRR
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

-- ====== TJs com e-SAJ ======
-- SP (sistema principal histórico)
INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJSP','e-SAJ','https://esaj.tjsp.jus.br','esaj', true) -- Fonte: TJSP
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

-- Alguns TJs do Norte/Nordeste ainda usam SAJ em parte das competências (ex.: AC, AM, AL)
INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJAC','e-SAJ','https://esaj.tjac.jus.br','esaj', true) -- Fonte: TJAC
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJAM','e-SAJ','https://consultasaj.tjam.jus.br','esaj', true) -- Fonte: TJAM
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJAL','e-SAJ','https://www2.tjal.jus.br','esaj', true) -- Fonte: TJAL
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

-- ====== Placeholders (PJe) para cobrir Estados restantes caso já existam linhas PJe como default ======
-- (Se você já criou linhas PJe como default para MA, MT, MS, TO e SE, os UPSERTs abaixo preenchem a base_url.)
INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJMA','PJe','https://pje.tjma.jus.br','pje', true)
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJMT','PJe','https://pje.tjmt.jus.br','pje', true)
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJMS','PJe','https://pje.tjms.jus.br','pje', true)
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

INSERT INTO court_systems (court, system_key, base_url, scraper_slug, enabled)
VALUES 
('TJTO','PJe','https://pje.tjto.jus.br','pje', true)
ON CONFLICT (court, system_key) DO UPDATE SET
  base_url=EXCLUDED.base_url, scraper_slug=EXCLUDED.scraper_slug, enabled=EXCLUDED.enabled;

-- ====== Relatório rápido pós-execução ======
-- Consulte quais continuam sem URL definida na linha default (priority = 1):
-- SELECT c.court, cs.system_key, cs.base_url FROM court_systems cs
-- JOIN (SELECT court, MIN(priority) AS min_p FROM court_systems WHERE enabled GROUP BY court) d
--   ON cs.court = d.court AND cs.priority = d.min_p
-- WHERE (cs.base_url IS NULL OR cs.base_url = '');
