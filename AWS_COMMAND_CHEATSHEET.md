# AWS Production Support — Command Cheatsheet

Set an approved profile/region:
```powershell
$env:AWS_PROFILE = "YOUR_PROFILE"
$env:AWS_REGION = "ap-south-1"
aws sts get-caller-identity
```

## EC2
```bash
aws ec2 describe-instances --instance-ids i-xxxxxxxx
aws ec2 describe-instance-status --instance-ids i-xxxxxxxx --include-all-instances
aws ec2 describe-volumes --filters Name=attachment.instance-id,Values=i-xxxxxxxx
```
Linux: `uptime`, `top`, `free -h`, `df -h`, `df -i`, `systemctl --failed`, `journalctl --since "30 minutes ago"`, `ss -lntp`.
Windows: `Get-Service`, `Get-Process | Sort-Object CPU -Descending | Select-Object -First 10`, `Get-Volume`, `Get-WinEvent -LogName System -MaxEvents 100`.

## ALB / ASG
```bash
aws elbv2 describe-target-health --target-group-arn <TG_ARN>
aws elbv2 describe-listeners --load-balancer-arn <ALB_ARN>
aws elbv2 describe-rules --listener-arn <LISTENER_ARN>
aws autoscaling describe-scaling-activities --auto-scaling-group-name <ASG>
```
Check target reason codes, health path/port/protocol, SG, NACL return path, app listener, startup and deployment history.

## VPC
```bash
aws ec2 describe-security-groups --group-ids sg-xxxxxxxx
aws ec2 describe-network-acls --filters Name=vpc-id,Values=vpc-xxxxxxxx
aws ec2 describe-route-tables --filters Name=vpc-id,Values=vpc-xxxxxxxx
aws ec2 describe-vpc-endpoints --filters Name=vpc-id,Values=vpc-xxxxxxxx
```
Network: `ip addr`, `ip route`, `getent hosts hostname`, `curl -Iv --connect-timeout 5 https://host/health`, `nc -vz db.internal 5432`.

## RDS
```bash
aws rds describe-db-instances --db-instance-identifier <DB_ID>
aws rds describe-events --source-type db-instance --source-identifier <DB_ID> --duration 1440
```
PostgreSQL read-only: `SELECT state, wait_event_type, wait_event, count(*) FROM pg_stat_activity GROUP BY 1,2,3;`
MySQL read-only: `SHOW GLOBAL STATUS LIKE 'Threads_connected';` and `SHOW FULL PROCESSLIST;`
Coordinate expensive queries and session termination with DBA.

## ECS
```bash
aws ecs describe-services --cluster <CLUSTER> --services <SERVICE>
aws ecs list-tasks --cluster <CLUSTER> --service-name <SERVICE> --desired-status STOPPED
aws ecs describe-tasks --cluster <CLUSTER> --tasks <TASK_ARN>
aws ecs describe-task-definition --task-definition <FAMILY:REVISION>
aws logs tail <LOG_GROUP> --since 30m
```
Inspect stoppedReason, exit code, image, execution role, secrets, CPU/memory, health checks and subnet IP capacity.

## EKS
```bash
kubectl get nodes -o wide
kubectl get pods -A -o wide
kubectl get events -A --sort-by=.lastTimestamp
kubectl describe pod <POD> -n <NS>
kubectl logs <POD> -n <NS> --all-containers --since=30m
kubectl logs <POD> -n <NS> --previous
kubectl top nodes
kubectl top pods -A
```
Do not delete pods, drain nodes or roll back without approval and disruption review.

## Lambda
```bash
aws lambda get-function-configuration --function-name <FUNCTION>
aws lambda get-function-concurrency --function-name <FUNCTION>
aws lambda list-aliases --function-name <FUNCTION>
aws logs tail /aws/lambda/<FUNCTION> --since 30m
```
Check Errors, Throttles, Duration, concurrency, timeout, memory, VPC path, IAM and event backlog.

## S3 / CloudFront
```bash
aws s3api head-bucket --bucket <BUCKET>
aws s3api head-object --bucket <BUCKET> --key <KEY>
aws s3api get-public-access-block --bucket <BUCKET>
aws s3api get-bucket-encryption --bucket <BUCKET>
aws cloudfront get-distribution --id <DIST_ID>
```
A 403 may be IAM/bucket policy, explicit deny, SCP, endpoint policy, KMS, ownership or OAC.

## Route 53 / ACM / CloudWatch
```bash
aws route53 list-resource-record-sets --hosted-zone-id <ZONE_ID>
aws acm describe-certificate --certificate-arn <CERT_ARN> --region us-east-1
aws cloudwatch describe-alarms --state-value ALARM
aws cloudwatch describe-alarm-history --alarm-name <ALARM>
aws cloudtrail lookup-events --max-results 20
```
DNS/TLS: `dig hostname A`, `dig NS domain`, `curl -Iv https://hostname`, `openssl s_client -connect hostname:443 -servername hostname`.

Initial triage favors describe/get/list/head/status and logs. Treat stop/start/reboot/modify/update/delete/put/scale/failover/rollback as change actions. Redact secrets and customer data.
