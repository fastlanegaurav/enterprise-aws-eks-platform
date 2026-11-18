# Terraform infrastructure

This starter provisions a VPC, an EKS cluster with a managed node group, and an ECR repository.

## Important

- Review provider/module versions and EKS version compatibility before applying.
- The example uses local Terraform state. Configure an encrypted S3 backend with state locking for team use.
- Restrict EKS public endpoint access to your trusted `/32`, or use private connectivity.
- One NAT Gateway is used to reduce development cost; it is not a multi-AZ resilient production NAT design.
- EKS managed node group desired capacity and instance sizes incur ongoing charges.
