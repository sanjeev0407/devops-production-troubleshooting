# Runbook 07 — S3 AccessDenied / CloudFront 403
1. Capture bucket/key, caller role, region, request ID, endpoint and exact status.
2. `aws sts get-caller-identity`; `aws s3api head-object --bucket <BUCKET> --key <KEY>`.
3. Review identity/bucket policy, SCP, permissions boundary, session policy, VPC endpoint policy and explicit Deny.
4. For SSE-KMS inspect KMS key policy and decrypt authorization; for CloudFront verify OAC/OAI and origin policy.
5. Never make bucket public or add wildcard principal. Security-approved least-privilege policy change only.
6. Validate intended principal succeeds and unauthorized principal remains denied.
