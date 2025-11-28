-- Auto-generated from joins-postgres.psd1 (map@mtime:2025-11-27T17:17:38Z)
-- engine: postgres
-- view:   system_jobs_metrics

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
