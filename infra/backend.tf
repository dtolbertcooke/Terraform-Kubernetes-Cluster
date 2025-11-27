# In terraform-eks.yml:
# 1. fetch state backend config from SSM Parameter Store
# 2. write to dev.hcl
# 3. init backend with -backend-config=dev.hcl flag during terraform init
# terraform {
#   backend "s3" {
#     # configuration will be loaded from dev.hcl
#     # when initializing terraform with:
#     # terraform init -backend-config=dev.hcl
#     # in eks.yml workflow
#   }
# }
terraform {
  backend "s3" {
    # configuration will be loaded from dev.hcl
    # when initializing terraform with:
    # terraform init -backend-config=dev.hcl
    # in the terraform-eks workflow
    bucket         = "state-bucket-global-a790f21e87"
    key            = "eks-project/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-table-global-infra"
  }
}