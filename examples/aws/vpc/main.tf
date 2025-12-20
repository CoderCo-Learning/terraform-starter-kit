terraform {
  required_version = ">= 1.11.0"

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
module "vpc" {
  source              = "../../../modules/aws/vpc"
  name                = "example-vpc"
  vpc_cidr_block      = "10.0.0.0/16"
  azs                 = ["eu-west-2a", "eu-west-2b"]
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

  create_private_subnets = true
  private_subnet_cidrs   = ["10.0.3.0/24", "10.0.4.0/24"]
  # If you don't want private subnets, set create_private_subnets = false and use []

  enable_nat_gateway = false # Enables outbound internet access for private subnets
  enable_flow_logs   = false

  tags = {
    Environment = "dev"
    Owner       = "coderco"
  }
}