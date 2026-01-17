terraform {
  required_version = ">= 1.11.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.24.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}

module "s3" {
  source = "../../../../modules/aws/s3"

  bucket_name   = "example-s3-${random_id.suffix.hex}"
  force_destroy = false
  enable_versioning = false
  enable_encryption = false
}