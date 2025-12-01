# In terraform-eks.yml:
# 1. fetch state backend config from SSM Parameter Store
# 2. write to dev.hcl
# 3. init backend with -backend-config=dev.hcl flag during terraform init
terraform {
  backend "s3" {
    # configuration will be loaded from eks.hcl
    # when initializing terraform with:
    # terraform init -backend-config=eks.hcl
    # in eks.yml workflow
  }
}
