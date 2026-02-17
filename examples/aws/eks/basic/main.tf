terraform {
  required_version = ">= 1.12.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.24.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

module "eks" {
  source = "../../../../modules/aws/eks"
  # source = "git::https://github.com/CoderCo-Learning/terraform-starter-kit//modules/aws/eks"

  # Required variables
  name                  = "my-eks-cluster"
  cluster-version       = "1.34"
  cluster-subnet-ids    = ["subnet-1234567890abcdef0", "subnet-0987654321fedcba0"] # Replace with your subnet IDs
  node-group-subnet-ids = ["subnet-1234567890abcdef0", "subnet-0987654321fedcba0"] # Replace with your subnet IDs

  # Optional variables
  node-group-name    = "my-node-group"          # Defaults to "node-group"
  desired-size       = 2                        # Defaults to 2
  max-size           = 3                        # Defaults to 3
  min-size           = 1                        # Defaults to 1
  instance-disk-size = 20                       # Defaults to 20
  instance-types     = ["t3.medium"]            # Defaults to ["t3.medium"]
  capacity-type      = "ON_DEMAND"              # Defaults to "ON_DEMAND"
  ami-type           = "AL2023_x86_64_STANDARD" # Optional - EKS will choose based on cluster version if not specified

  endpoint-private-access = false # Defaults to false
  endpoint-public-access  = true  # Defaults to true

  authentication-mode                         = "API" # Defaults to "API"
  bootstrap-cluster-creator-admin-permissions = true  # Defaults to true

  upgrade_support_type = "STANDARD" # Defaults to "STANDARD"

  labels = {
    example-key = "example-value" # Optional, defaults to {}
  }

  taints = [] # Optional, defaults to []
  # taints = [
  #   {
  #     key    = "key1"
  #     value  = "value1"
  #     effect = "NO_SCHEDULE"
  #   }
  # ]

}
