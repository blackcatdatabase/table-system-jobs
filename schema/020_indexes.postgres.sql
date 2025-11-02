-- Auto-generated from schema-map-postgres.psd1 (map@db2f8b8)
-- engine: postgres
-- table:  system_jobs
CREATE INDEX IF NOT EXISTS idx_system_jobs_status_sched ON system_jobs (status, scheduled_at);
