locals {
  config = yamldecode(file("${path.module}/env/${var.environment}.yml"))
}
