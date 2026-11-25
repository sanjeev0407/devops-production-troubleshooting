# Runbook Index
| Runbook | Symptom | Tools / escalation |
|---|---|---|
| [01 ALB 5xx](runbooks/01-alb-5xx.md) | 502/503/504, unhealthy targets | ELB, CloudWatch, app logs / App-SRE-Network |
| [02 EC2](runbooks/02-ec2.md) | High CPU, disk, unreachable | EC2, SSM, OS / Platform-Network |
| [03 RDS](runbooks/03-rds.md) | CPU, connections, storage | RDS, CloudWatch, SQL / DBA |
| [04 ECS](runbooks/04-ecs.md) | Tasks stopped, deployment unhealthy | ECS, ECR, Logs / Container-App |
| [05 EKS](runbooks/05-eks.md) | Pending, CrashLoopBackOff | kubectl, EKS / Kubernetes-App |
| [06 DNS-TLS](runbooks/06-dns-tls.md) | NXDOMAIN, wrong endpoint, certificate | Route 53, ACM, dig / DNS-Security |
| [07 S3](runbooks/07-s3-access-denied.md) | AccessDenied / CloudFront 403 | S3, IAM, KMS / Cloud-Security |
| [08 Lambda](runbooks/08-lambda.md) | Errors, throttles, timeout | Lambda, CloudWatch / Serverless-App |
| [09 Rollback](runbooks/09-rollback.md) | Regression after release | Pipeline, metrics / Release-App |

Stop and escalate for suspected compromise, data-loss risk, irreversible changes, unconfirmed account/region/resource or missing approval.
