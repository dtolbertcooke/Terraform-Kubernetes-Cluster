module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "${var.project_name}-vpc"
  cidr = "10.0.0.0/16"

  azs = [
    "${var.region}a",
    "${var.region}b",
    "${var.region}c"
  ]

  public_subnets = [
    "10.0.0.0/20",
    "10.0.16.0/20",
    "10.0.32.0/20"
  ]

  private_subnets = [
    "10.0.48.0/20",
    "10.0.64.0/20",
    "10.0.80.0/20"
  ]

  enable_nat_gateway = true
  single_nat_gateway = true

  # Required EKS tags
  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  tags = {
    Project = var.project_name
  }
}
