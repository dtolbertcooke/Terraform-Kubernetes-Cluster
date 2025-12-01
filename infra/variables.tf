variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "eks-demo-cluster"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "eks-demo-api"
}

# variable "vpc_id" {
#   description = "VPC ID where EKS cluster will be deployed"
#   type        = string
# }

# variable "private_subnet_ids" {
#   description = "List of private subnet IDs for the EKS cluster"
#   type        = list(string)
# }

