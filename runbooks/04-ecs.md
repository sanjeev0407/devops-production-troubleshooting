# Runbook 04 — ECS Tasks Stop / Deployment Unhealthy
1. Confirm cluster, service, launch type, task revision and desired/running counts.
2. `aws ecs describe-services --cluster <CLUSTER> --services <SERVICE>`.
3. List stopped tasks and `aws ecs describe-tasks`; inspect stoppedReason, container reason and exit code.
4. Check image digest, logs, CPU/memory, health check, execution role, secret/KMS access and subnet IP capacity.
5. `CannotPullContainerError`: ECR image/tag, permissions and network. Secret failure: task execution role, ARN/region and KMS. OOM: memory limit and heap.
6. Roll back to known-good task definition through approved pipeline only.
7. Validate healthy running count, target health, clean startup and smoke test.
