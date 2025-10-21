# 📦 System Jobs

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

> Schema package for table **system_jobs** (repo: `system-jobs`).

## Files
```
schema/
  001_table.sql
  # (no deferred indexes declared in map)
  # (no foreign keys declared in map)
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| id | BIGINT UNSIGNED | — | — | AUTO_INCREMENT, PK |
| job_type | VARCHAR(100) | NO | — |  |
| payload | JSON | YES | — |  |
| status | ENUM('pending','processing','done','failed') | NO | '' |  |
| retries | INT | NO | 0 |  |
| scheduled_at | DATETIME(6) | YES | — |  |
| started_at | DATETIME(6) | YES | — |  |
| finished_at | DATETIME(6) | YES | — |  |
| error | TEXT | YES | — |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) |  |
| updated_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) |  |

## Relationships
- No outgoing foreign keys.

```mermaid
erDiagram
  SYSTEM_JOBS {
    INT id PK
    VARCHAR job_type
    JSON payload
    ENUM status
    INT retries
    DATETIME scheduled_at
    DATETIME started_at
    DATETIME finished_at
    VARCHAR error
    DATETIME created_at
    DATETIME updated_at
  }
```

## Indexes
- No deferred indexes declared for this table.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.

