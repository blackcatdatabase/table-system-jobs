-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  system_jobs

CREATE INDEX IF NOT EXISTS idx_system_jobs_status_sched ON system_jobs (status, scheduled_at);

CREATE INDEX IF NOT EXISTS idx_system_jobs_locked_until ON system_jobs (locked_until);
