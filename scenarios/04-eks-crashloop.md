# Scenario 04 — EKS CrashLoopBackOff
Fictional alert: replicas restart after release. Inspect describe pod, previous logs, events, exit code, OOMKilled, probes, config/secret, image and node pressure.
**Exercise root cause:** JVM heap exceeds container memory limit.
**Recovery:** approved rollback after schema compatibility check.
**Prevention:** heap sizing, resource/load tests and OOM alerts.
