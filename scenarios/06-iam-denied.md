# Scenario 06 — S3 AccessDenied
Fictional alert: application logs AccessDenied on GetObject after deployment. Confirm workload role, bucket/key/region, identity/resource policies, SCP, boundary, endpoint policy, explicit Deny, KMS and ownership.
**Exercise root cause:** task role changed but bucket policy trusts previous role.
**Recovery:** security-approved least-privilege policy update through IaC. Never make bucket public.
**Prevention:** policy tests, role validation and CloudTrail data event coverage.
