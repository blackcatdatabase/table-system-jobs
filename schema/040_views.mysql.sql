-- Auto-generated from schema-views-mysql.psd1 (map@38d5403)
-- engine: mysql
-- table:  system_jobs
-- Contract view for [system_jobs]
CREATE OR REPLACE SQL SECURITY INVOKER VIEW vw_system_jobs AS
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
  updated_at
FROM system_jobs;
