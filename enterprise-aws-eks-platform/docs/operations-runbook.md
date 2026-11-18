# Operations runbook

## Verify cluster and workload

```bash
kubectl get nodes -o wide
kubectl get pods -n platform -o wide
kubectl get deploy,svc,hpa,pdb -n platform
kubectl describe deployment platform-api -n platform
```

## Diagnose an unhealthy pod

```bash
kubectl get pods -n platform
kubectl describe pod <pod-name> -n platform
kubectl logs <pod-name> -n platform --previous
kubectl get events -n platform --sort-by=.lastTimestamp
```

Check:
- Image repository and immutable tag
- ECR pull permissions / node role
- Readiness and liveness endpoints
- CPU/memory requests and limits
- Node capacity and scheduling constraints

## Roll back a Helm release

```bash
helm history platform-api -n platform
helm rollback platform-api <REVISION> -n platform
```

If Argo CD owns the application, perform rollback through the GitOps source of truth rather than allowing manual drift to persist.

## Scale

The HPA scales between configured minimum and maximum replicas based on CPU utilization. Verify that the cluster has the Kubernetes Metrics Server available and that containers define CPU requests.
