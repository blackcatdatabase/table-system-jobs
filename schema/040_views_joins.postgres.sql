-- Auto-generated from core/joins-postgres.yaml (map@sha1:29CF395A3A4C8964482083733F8E613ABFBEF5CC)
-- engine: postgres
-- view:   system_jobs_metrics

-- Metrics for [system_jobs]
CREATE OR REPLACE VIEW vw_system_jobs_metrics AS
SELECT
  job_type,
  status,
  COUNT(*) AS total,
  COUNT(*) FILTER (WHERE status=$$pending$$    AND (scheduled_at IS NULL OR scheduled_at <= now())) AS due_now,
  COUNT(*) FILTER (WHERE status=$$processing$$) AS processing,
  COUNT(*) FILTER (WHERE status=$$failed$$)     AS failed
FROM system_jobs
GROUP BY job_type, status
ORDER BY job_type, status;
