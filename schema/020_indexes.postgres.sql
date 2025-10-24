-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-10-24T09:46:38Z)
-- engine: postgres
-- table:  system_jobs
CREATE INDEX idx_system_jobs_status_sched ON system_jobs (status, scheduled_at);
