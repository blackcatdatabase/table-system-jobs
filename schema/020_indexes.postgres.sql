-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-11-21T00:25:46Z)
-- engine: postgres
-- table:  system_jobs

CREATE INDEX IF NOT EXISTS idx_system_jobs_status_sched ON system_jobs (status, scheduled_at);

CREATE INDEX IF NOT EXISTS idx_system_jobs_locked_until ON system_jobs (locked_until) WHERE status = 'processing';

CREATE UNIQUE INDEX IF NOT EXISTS ux_system_jobs_unique_key_live ON system_jobs (unique_key_hash) WHERE unique_key_hash IS NOT NULL AND status IN ('pending','processing');
