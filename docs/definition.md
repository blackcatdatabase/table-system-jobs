# Definition – system_jobs

Asynchronous background jobs (generic).

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| job_type | VARCHAR(100) | NO | — | Job type key. |  |
| payload | JSON | YES | — | JSON payload. |  |
| status | ENUM('pending','processing','done','failed') | NO | ''pending'' | Processing status. | enum: pending, processing, done, failed |
| retries | INT | NO | 0 | Retry count. |  |
| scheduled_at | DATETIME(6) | YES | — | Schedule time (UTC). |  |
| started_at | DATETIME(6) | YES | — | Start time (UTC). |  |
| finished_at | DATETIME(6) | YES | — | Finish time (UTC). |  |
| error | TEXT | YES | — | Last error message. |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| updated_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |  |
