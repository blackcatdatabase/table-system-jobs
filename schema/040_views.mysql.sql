-- Auto-generated from schema-views-mysql.psd1 (map@mtime:2025-11-27T15:35:35Z)
-- engine: mysql
-- table:  system_jobs

-- Contract view for [system_jobs]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_system_jobs AS
SELECT
  id,
  job_type,
  payload,
  status,
  retries,
  scheduled_at,
  started_at,
  finished_at,
  error,
  created_at,
  updated_at,
  version
FROM system_jobs;
