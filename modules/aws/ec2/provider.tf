provider "aws" {
  region = var.region

  default_tags {
    tags = {
      ManagedBy = "Terraform"
      Module    = "CoderCo community module - ec2"
    }
  }
}
