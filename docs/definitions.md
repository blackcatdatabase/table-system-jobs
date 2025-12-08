# system_jobs

Asynchronous background jobs (generic).

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| error | TEXT | YES |  | Last error message. |
| finished_at | TIMESTAMPTZ(6) | YES |  | Finish time (UTC). |
| id | BIGINT | NO |  | Surrogate primary key. |
| job_type | VARCHAR(100) | NO |  | Job type key. |
| payload | JSONB | YES |  | JSON payload. |
| retries | INTEGER | NO | 0 | Retry count. |
| scheduled_at | TIMESTAMPTZ(6) | YES |  | Schedule time (UTC). |
| started_at | TIMESTAMPTZ(6) | YES |  | Start time (UTC). |
| status | TEXT | NO | pending | Processing status. (enum: pending, processing, done, failed) |
| updated_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |

## Engine Details

### mysql

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_system_jobs_locked_until | locked_until | INDEX idx_system_jobs_locked_until (locked_until) |
| idx_system_jobs_status_sched | status,scheduled_at | INDEX idx_system_jobs_status_sched (status, scheduled_at) |

### postgres

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_system_jobs_locked_until | locked_until | CREATE INDEX IF NOT EXISTS idx_system_jobs_locked_until ON system_jobs (locked_until) |
| idx_system_jobs_status_sched | status,scheduled_at | CREATE INDEX IF NOT EXISTS idx_system_jobs_status_sched ON system_jobs (status, scheduled_at) |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_system_jobs | mysql | algorithm=MERGE, security=INVOKER | [packages\system-jobs\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/system-jobs/schema/040_views.mysql.sql) |
| vw_system_jobs_metrics | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\system-jobs\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/system-jobs/schema/040_views_joins.mysql.sql) |
| vw_system_jobs | postgres |  | [packages\system-jobs\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/system-jobs/schema/040_views.postgres.sql) |
| vw_system_jobs_metrics | postgres |  | [packages\system-jobs\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/system-jobs/schema/040_views_joins.postgres.sql) |
