# Project 6 — AWS Production Support & Troubleshooting

Interview-ready operations portfolio: P1–P4 incident handling, AWS investigation commands, RCA, runbooks, recovery, and prevention across EC2, ALB, VPC, Route 53, ACM, S3, CloudFront, RDS, ECS, EKS, Lambda, IAM and CloudWatch.

## Safety
Use an approved read-only role for triage. Restart, scale, failover, rollback, policy/network changes and deletion require authorization, impact assessment, change record and rollback plan. Never commit credentials, customer data, private logs, `.env`, private keys or Terraform state.

## Contents
- `INCIDENT_MANAGEMENT.md`: severity, response, communication, escalation
- `AWS_COMMAND_CHEATSHEET.md`: AWS CLI, Linux, PowerShell, kubectl and SQL diagnostics
- `RCA_TEMPLATE.md`, `INCIDENT_TICKET_TEMPLATE.md`
- `runbooks/`: nine service troubleshooting runbooks
- `scenarios/`: six fictional incident exercises
- `scripts/`: read-only PowerShell health check, Linux evidence collector, Logs Insights queries
- `sample-data/`: fictional JSON incident and application log
- `interview/`: scenario Q&A and shift handover

## Prerequisites and start
AWS CLI v2, approved AWS profile, PowerShell 7+ on Windows; optional Bash, kubectl, curl, dig, openssl.
```powershell
aws sts get-caller-identity --profile YOUR_PROFILE
aws configure get region --profile YOUR_PROFILE
.\scripts\aws-readonly-health-check.ps1 -Profile YOUR_PROFILE -Region ap-south-1
```
Optional:
```powershell
.\scripts\aws-readonly-health-check.ps1 -Profile YOUR_PROFILE -Region ap-south-1 -TargetGroupArns @("YOUR_TG_ARN") -RdsIdentifiers @("YOUR_DB") -EcsClusters @("YOUR_CLUSTER")
```

## Standard incident flow
Acknowledge and classify → confirm business impact/scope/time → check alarms, dashboards, recent changes, metrics and logs → record evidence → escalate with a specific ask → approved reversible mitigation → validate a business transaction → monitor → RCA and preventive actions.

## Suggested practice plan
| Day | Focus | Evidence |
|---|---|---|
| 1 | Incident lifecycle / P1–P4 | Ticket |
| 2 | EC2 / CloudWatch | Sanitized evidence |
| 3 | ALB 5xx | Investigation |
| 4 | RDS | RCA |
| 5 | ECS | Task diagnosis |
| 6 | EKS | kubectl evidence |
| 7 | DNS/TLS/S3/IAM | Troubleshooting notes |
| 8 | Lambda / Logs Insights | Query output |
| 9 | Tabletop + handover | Timeline |
| 10 | GitHub + mock interview | Portfolio walkthrough |

## Publish
Create an empty GitHub repository `aws-production-support` under `sanjeev0407`:
```powershell
git init
git add .
git commit -m "Add AWS production support and troubleshooting portfolio"
git branch -M main
git remote add origin https://github.com/sanjeev0407/aws-production-support.git
git push -u origin main
```
See `GITHUB_PUBLISH.md` and sanitize all evidence first.

## AWS references
- https://docs.aws.amazon.com/wellarchitected/latest/framework/ops05-bp01.html
- https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/responding-to-events.html
- https://docs.aws.amazon.com/wellarchitected/latest/framework/rel12-bp01.html
