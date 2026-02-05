# I pin both the Terraform version and the provider version to avoid unexpected breaking changes.”

terraform {
  required_version = ">= 1.2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.15.0"
    }
  }
}
