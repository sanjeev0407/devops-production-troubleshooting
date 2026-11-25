# Runbook 08 — Lambda Errors / Throttles / Timeouts
1. Check Errors, Throttles, Duration, ConcurrentExecutions, async backlog/age and event source mapping.
2. `aws lambda get-function-configuration --function-name <FUNCTION>`; inspect concurrency, aliases and `/aws/lambda/<FUNCTION>` logs.
3. Check timeout/memory, reserved concurrency, init errors, VPC ENI/DNS/routes, IAM/KMS, downstream limits and recent version changes.
4. Rollback alias or change concurrency/memory only with approval and downstream capacity review.
5. Validate errors/throttles, duration, backlog, downstream health and end-to-end transaction.
