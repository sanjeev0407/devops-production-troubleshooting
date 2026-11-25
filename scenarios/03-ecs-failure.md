# Scenario 03 — ECS Deployment Unhealthy
Fictional alert: desired tasks 6, running tasks 2. Inspect service events, stopped reason, exit code, image, execution role, secrets/KMS, memory, health checks and subnet IP capacity.
**Exercise root cause:** task definition points to secret ARN in wrong region.
**Recovery:** approved rollback then correct ARN/IAM in IaC.
**Prevention:** secret region/existence validation and deployment circuit breaker.
