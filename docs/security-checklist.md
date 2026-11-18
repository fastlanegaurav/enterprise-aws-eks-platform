# Security checklist

- [ ] Use GitHub OIDC trust restricted to this repository and branch/environment.
- [ ] Scope IAM permissions to the specific ECR repository and required actions.
- [ ] Restrict EKS API access; prefer private endpoint access for production.
- [ ] Use private subnets for worker nodes.
- [ ] Store Terraform state remotely with encryption, versioning and access controls before team use.
- [ ] Do not commit secrets, state files, kubeconfig or plan files.
- [ ] Scan source dependencies and container images.
- [ ] Pin third-party GitHub Actions to full commit SHAs for hardened production workflows.
- [ ] Review Kubernetes RBAC and service account permissions.
- [ ] Add NetworkPolicies and a Pod Security Admission policy appropriate to the cluster.
- [ ] Enable EKS control-plane audit/authenticator logs and define retention.
- [ ] Define backup, restore, upgrade and incident response procedures.
