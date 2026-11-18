variable "aws_region" {
  description = "AWS region for the platform."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Short project identifier used in resource names."
  type        = string
  default     = "enterprise-eks"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "dev"
}

variable "kubernetes_version" {
  description = "EKS Kubernetes version supported by the selected EKS module version."
  type        = string
  default     = "1.31"
}

variable "vpc_cidr" {
  description = "VPC CIDR."
  type        = string
  default     = "10.40.0.0/16"
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "Trusted IPv4 CIDRs allowed to reach the public EKS API endpoint. Set to your public IP /32; avoid 0.0.0.0/0."
  type        = list(string)
  default     = ["127.0.0.1/32"]
}

variable "node_instance_types" {
  description = "EC2 instance types for the managed node group."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_min_size" {
  type    = number
  default = 1
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "node_max_size" {
  type    = number
  default = 3
}
