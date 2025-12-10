provider "aws" {
  default_tags {
    tags = {
      ManagedBy = "Terraform"
      Module    = "CoderCo community module - ecs"
    }
  }
}

