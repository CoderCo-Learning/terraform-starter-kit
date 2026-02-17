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
  cluster-version         = "1.34"
  cluster-subnet-ids      = concat(aws_subnet.public[*].id, aws_subnet.private[*].id)
  node-group-subnet-ids   = aws_subnet.private[*].id
  endpoint-private-access = true
  endpoint-public-access  = true

}
