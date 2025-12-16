-- Auto-generated from schema-map-postgres.yaml (map@sha1:FAEA49A5D5F8FAAD9F850D0F430ED451C5C1D707)
-- engine: postgres
-- table:  system_jobs

CREATE INDEX IF NOT EXISTS idx_system_jobs_status_sched ON system_jobs (status, scheduled_at);

CREATE INDEX IF NOT EXISTS idx_system_jobs_locked_until ON system_jobs (locked_until);
