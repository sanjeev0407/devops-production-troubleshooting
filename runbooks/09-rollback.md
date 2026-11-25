# Runbook 09 — Deployment Regression / Rollback
1. Confirm release ID, start time, impact and deployment strategy.
2. Correlate error/latency/health metrics with release timeline.
3. Check config/secrets, schema migration and downstream compatibility.
4. Identify last known-good artifact, image digest, task definition or ReplicaSet.
5. Obtain incident/release owner approval; use pipeline/GitOps rollback, not ad-hoc console edits.
6. Record approver, operator, before/after version and change reference.
7. Validate smoke test, health checks, business transaction, backlog, errors and latency.
8. Preserve failed artifact/logs and create RCA actions for canary, guardrails and migration compatibility.
