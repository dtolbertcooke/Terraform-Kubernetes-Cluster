resource "aws_ecr_repository" "api" {
  name = "${var.project_name}-repo"
  
  force_delete = true
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.37.2"

  cluster_name    = var.cluster_name
  cluster_version = "1.30"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_cluster_creator_admin_permissions = true

  cluster_endpoint_public_access  = true # Enable public access to the EKS cluster endpoint for development purposes
  cluster_endpoint_private_access = true 
  
  # Enable IAM roles for service accounts (IRSA)
  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      max_size       = 3
      min_size       = 1
      instance_types = ["t3.small"]
      
      # Ensure proper IAM permissions
      iam_role_attach_cni_policy = true
      
      # Use default launch template configuration
      use_custom_launch_template = false
      
      # Ensure node IAM role has necessary permissions
      iam_role_additional_policies = {
        AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      }
    }
  }
}
