# Runbook 01 — ALB 5xx / Unhealthy Targets
1. Confirm URL, status, first failure, scope, request ID and business transaction.
2. Check `HTTPCode_ELB_5XX_Count`, `HTTPCode_Target_5XX_Count`, `TargetResponseTime`, `HealthyHostCount`, `UnHealthyHostCount`, `TargetConnectionErrorCount`.
3. Run `aws elbv2 describe-target-health --target-group-arn <TG_ARN>` and inspect listeners/rules.
4. No healthy targets: check health path/port/protocol, app process, SG ALB-to-target, NACL return path, routes, startup and registration.
5. Healthy targets but target 5xx: inspect app exceptions, DB/dependency, thread pool, saturation and release.
6. 504: inspect target/downstream latency and timeout.
7. Rollback or scale only with incident/change approval and capacity check.
8. Validate synthetic and real transaction, target health, error/latency baseline and observation window. Preserve logs, metrics, target reason codes and release ID for RCA.
