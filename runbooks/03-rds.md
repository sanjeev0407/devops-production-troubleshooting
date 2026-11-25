# Runbook 03 — RDS CPU / Connections / Storage
1. Confirm DB identifier, engine, writer/reader, region and dependent application.
2. Review CPU, DatabaseConnections, FreeableMemory, FreeStorageSpace, IOPS, latency, queue depth, replica lag and RDS events.
3. `aws rds describe-db-instances --db-instance-identifier <DB>`; `aws rds describe-events --source-type db-instance --source-identifier <DB> --duration 1440`.
4. PostgreSQL read-only: `SELECT state, wait_event_type, wait_event, count(*) FROM pg_stat_activity GROUP BY 1,2,3;`
5. MySQL read-only: `SHOW GLOBAL STATUS LIKE 'Threads_connected'; SHOW FULL PROCESSLIST;`
6. Check pool leak, long queries, locks, batch jobs, storage growth, maintenance and recent changes.
7. Session termination, storage/class change or failover requires DBA approval.
8. Validate app connections, latency, storage headroom and replication health.
