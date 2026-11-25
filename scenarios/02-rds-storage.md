# Scenario 02 — RDS Storage Pressure
Fictional alert: FreeStorageSpace falls below threshold and writes fail. Review storage, IOPS, latency, DB events and batch jobs; DBA checks table/index growth, temp files, replication slots/binlogs and long transactions.
**Exercise root cause:** batch created staging table and cleanup job failed.
**Recovery:** DBA-approved cleanup/archive, pause batch or approved storage increase. Never delete DB files manually.
**Prevention:** storage forecast, low-space alert, retention policy and batch guardrails.
