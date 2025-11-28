-- Auto-generated from joins-mysql.psd1 (map@mtime:2025-11-27T17:49:37Z)
-- engine: mysql
-- view:   system_jobs_metrics
-- Metrics for [system_jobs]
CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_system_jobs_metrics AS
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
