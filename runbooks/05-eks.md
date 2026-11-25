# Runbook 05 — EKS Pending / CrashLoopBackOff
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
Pending: inspect requests/allocatable, taints/tolerations, affinity, PVC/StorageClass/AZ, image pull and VPC CNI IP capacity.
CrashLoop: inspect previous logs, exit code, OOMKilled, probes, config/secret, image and dependencies.
Do not repeatedly delete pods. Rollback/change resources through approved GitOps process after schema compatibility check. Validate ready pods, endpoints, ingress and business transaction.
