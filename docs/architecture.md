# Architecture notes

## Network

The Terraform stack creates two Availability Zone subnet pairs:
- Public subnets for internet-facing load balancers.
- Private subnets for EKS worker nodes.
- A single NAT Gateway to reduce development cost.

For a high-availability production design, evaluate one NAT Gateway per AZ, private EKS API access, VPC endpoints, and egress controls.

## Compute

The EKS cluster uses an EC2 managed node group. The Helm chart configures application replicas, CPU/memory requests and limits, health probes, HPA and a PodDisruptionBudget.

## Delivery

GitHub Actions validates code and builds a container. The image publishing workflow uses OIDC to obtain short-lived AWS credentials and pushes an immutable commit-SHA tag to ECR. Argo CD watches the Git repository and reconciles the Helm release.

The sample intentionally separates image publishing from cluster deployment. A secure GitOps promotion step should update a GitOps values file with the immutable image tag, then let Argo CD reconcile it.
