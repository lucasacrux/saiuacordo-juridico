
-- fix_missing_base_urls.sql
-- 1) Quem ainda está sem base_url nos defaults?
SELECT court, system_key, priority, base_url
FROM court_systems
WHERE priority = 1 AND (base_url IS NULL OR base_url = '')
ORDER BY court;

-- 2) Template de UPSERT para preencher (copie e edite as linhas necessárias):
-- Exemplo:
-- INSERT INTO court_systems (court, system_key, priority, enabled, base_url, scraper_slug, notes)
-- VALUES ('TJPE','PJe',1,true,'https://pje.tjpe.jus.br','pje','PJe do TJPE')
-- ON CONFLICT (court, system_key) DO UPDATE
--   SET base_url = EXCLUDED.base_url,
--       scraper_slug = EXCLUDED.scraper_slug,
--       notes = EXCLUDED.notes,
--       enabled = true;
