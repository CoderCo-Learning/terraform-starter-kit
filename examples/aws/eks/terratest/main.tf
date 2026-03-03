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

  name                    = "test-eks-cluster"
  cluster_version         = "1.34"
  cluster_subnet_ids      = concat(aws_subnet.public[*].id, aws_subnet.private[*].id)
  node_group_subnet_ids   = aws_subnet.private[*].id
  endpoint_private_access = true
  endpoint_public_access  = true

}
