# AWS Production Support — Scenario Interview Q&A

1. **ALB 503:** Confirm impact; compare ELB vs target 5xx; inspect HealthyHostCount, target reasons, listener, health path/port, SG/NACL, app logs and deployment. Approved rollback; validate business transaction.
2. **EC2 CPU 95%:** Check instance health, CPU/network/memory/disk, `top`, `ps`, `free`, `df`, journal and recent jobs. Identify process; don't reboot first.
3. **RDS connections near max:** Check DatabaseConnections, CPU, memory, latency, pool behavior, sessions, locks and events. DBA investigates; don't terminate sessions without approval.
4. **ECS tasks stop:** Inspect events, stoppedReason, exit code, task definition, image, execution role, secrets, health checks, memory and subnet IPs.
5. **EKS CrashLoop:** Describe pod, previous logs, events, OOMKilled, probes, config/secret, image and dependencies.
6. **App cannot connect to RDS:** Verify endpoint/port, DNS, SG, NACL return ports, routes, DB status, TLS, credentials, connection limits and app logs.
7. **DNS works but HTTPS fails:** Check SAN/expiry/chain/SNI, ACM region, CloudFront alias or ALB listener cert, origin TLS and recent changes.
8. **S3 AccessDenied:** Check caller identity, policies, SCP, boundary, endpoint policy, explicit Deny, KMS and object ownership. Never make bucket public.
9. **P1 handling:** Acknowledge per SLA, establish incident command/bridge, assess impact, assign workstreams, timeline and updates, approved mitigation, validation, monitoring and RCA.
10. **Incident vs problem vs change:** Incident restores service; problem manages underlying cause/recurrence; change is controlled modification with risk, approval, validation and rollback.
11. **Escalation packet:** Impact, timeline, environment, IDs, redacted errors, correlation IDs, metrics/logs, recent changes, checks/results, hypotheses, workaround and specific ask.
12. **MTTR:** Mean Time to Restore/Recover (definition varies); improve with actionable alerts, service maps, runbooks, automation, ownership and rehearsals.
13. **P2 with workaround:** Downgrade only per approved severity matrix and reassessed impact.
14. **Bad deployment:** Correlate release/telemetry, check schema/config, identify last good artifact, obtain approval, pipeline rollback, validate and monitor.
15. **RCA:** Summary, impact, timeline, evidence, trigger, root cause, contributing factors, detection/recovery gaps, five whys and owned actions.
