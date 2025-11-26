output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

# verify if I need this later
output "ecr_repo_url" {
  value = aws_ecr_repository.api.repository_url
}

output "ecr_repo_name" {
  value = aws_ecr_repository.api.name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

# output "cluster_ca" {
#   value = module.eks.cluster_certificate_authority_data
# }