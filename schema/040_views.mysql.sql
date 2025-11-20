-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  system_jobs_metrics
-- Metrics for [system_jobs]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_system_jobs_metrics AS
SELECT
  job_type,
  status,
  COUNT(*) AS total,
  SUM(CASE WHEN status = 'pending' AND (scheduled_at IS NULL OR scheduled_at <= NOW()) THEN 1 ELSE 0 END) AS due_now,
  SUM(CASE WHEN status = 'processing' THEN 1 ELSE 0 END) AS processing,
  SUM(CASE WHEN status = 'failed' THEN 1 ELSE 0 END) AS failed
FROM system_jobs
GROUP BY job_type, status
ORDER BY job_type, status;

-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
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

