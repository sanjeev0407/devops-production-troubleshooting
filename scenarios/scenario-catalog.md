# Fictional Incident Scenario Catalog
All values and outcomes are training examples, not live AWS observations.
| Scenario | Priority | Symptom | Investigation |
|---|---|---|---|
| ALB 503 | P1/P2 | Checkout fails | Target health, health path, SG, deployment |
| RDS storage | P1/P2 | Writes fail | FreeStorageSpace, events, DB growth |
| ECS deployment | P1/P2 | Running count drops | Service events, stopped reason, secrets |
| EKS CrashLoop | P2/P3 | Pods restart | Previous logs, probes, OOM, config |
| DNS/TLS | P1/P2 | Host/certificate error | Delegation, ACM, SAN, listener |
| IAM AccessDenied | P2/P3 | App cannot read S3 | Caller role, policies, KMS |
