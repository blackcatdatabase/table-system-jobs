<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – system_jobs

Asynchronous background jobs (generic).

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| job_type | VARCHAR(100) | NO | — | Job type key. |  |
| payload | JSONB | YES | — | JSON payload. |  |
| status | TEXT | NO | 'pending' | Processing status. | enum: pending, processing, done, failed |
| retries | INTEGER | NO | 0 | Retry count. |  |
| scheduled_at | TIMESTAMPTZ(6) | YES | — | Schedule time (UTC). |  |
| started_at | TIMESTAMPTZ(6) | YES | — | Start time (UTC). |  |
| finished_at | TIMESTAMPTZ(6) | YES | — | Finish time (UTC). |  |
| error | TEXT | YES | — | Last error message. |  |
| unique_key_hash | CHAR(64) | YES | — |  |  |
| unique_key_version | VARCHAR(64) | YES | — |  |  |
| locked_until | TIMESTAMPTZ(6) | YES | — |  |  |
| locked_by | VARCHAR(100) | YES | — |  |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| updated_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |  |
| version | INTEGER | NO | 0 |  |  |