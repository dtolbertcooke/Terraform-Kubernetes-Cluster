# remote state is populated by the script in .github/workflows/main.yml
terraform {
  backend "s3" {
  }
}