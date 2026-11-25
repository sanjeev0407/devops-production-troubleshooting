# Incident Management

## Severity (follow the customer's approved SLA)
| Priority | Typical impact | Handling |
|---|---|---|
| P1 Critical | Production unavailable, major business impact or security incident | Immediate response, incident commander, bridge, frequent updates |
| P2 High | Major feature degraded / many users affected | High-priority response, service owner, rapid escalation |
| P3 Medium | Partial/limited impact, workaround exists | L1/L2 investigation, escalate as needed |
| P4 Low | Minor issue, request or cosmetic defect | Standard queue / planned work |

## First 10 minutes
1. Acknowledge and record detection time.
2. Confirm service, environment, account alias, region, resource and business impact.
3. Determine whether issue is ongoing, intermittent or recovered.
4. Check dashboards, alarms, recent deployments/changes and dependencies.
5. Assign incident lead and technical owner for P1/P2.
6. Start a timestamped timeline (UTC and local timezone).
7. Send factual initial update and next update time.
8. Do not claim an unconfirmed root cause.

## Investigation: 5W + 1H
What failed? Where (account/region/AZ/cluster/namespace)? When did it start? Who is affected? Why might it have happened (release/capacity/dependency/certificate/network/quota)? How can it be safely reproduced?

## Escalation packet
Incident ID, priority, impact, start time/timezone, resources, exact redacted error, correlation ID, metrics/logs, recent changes, checks/results, ruled-in/out hypotheses, workaround/risk and specific request.

## Communication examples
**Initial:** “We are investigating elevated 5xx errors affecting checkout in production. The issue began around 09:20 IST. The team is checking target health, recent deployments and application/database telemetry. Next update by 09:40 IST.”
**Progress:** “The load balancer is reachable; several targets are unhealthy. We are comparing target health with application startup logs and the latest deployment. Root cause is not confirmed.”
**Resolution:** “Synthetic checkout checks are passing and error rates have returned to baseline. We are monitoring for recurrence and will publish the RCA and follow-up actions.”

## Recovery / closure
Prefer reversible mitigation. Obtain approval before restart, scale, failover, rollback or IAM/network changes. Record approver/operator/change ID. Validate synthetic and real business transactions, dependencies, latency, error rate and queue depth. Close after the agreed observation window and stakeholder update. Create RCA with action owners and due dates.
