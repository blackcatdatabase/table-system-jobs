-- Auto-generated from schema-views-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  system_jobs_metrics
-- Metrics for [system_jobs]
CREATE OR REPLACE VIEW vw_system_jobs_metrics AS
SELECT
  job_type,
  status,
  COUNT(*) AS total,
  COUNT(*) FILTER (WHERE status=''pending'' AND (scheduled_at IS NULL OR scheduled_at <= now())) AS due_now,
  COUNT(*) FILTER (WHERE status=''processing'') AS processing,
  COUNT(*) FILTER (WHERE status=''failed'')     AS failed
FROM system_jobs
GROUP BY job_type, status
ORDER BY job_type, status;

-- Auto-generated from schema-views-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  system_jobs
-- Contract view for [system_jobs]
CREATE OR REPLACE VIEW vw_system_jobs AS
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

