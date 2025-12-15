provider "aws" {
  region = "eu-west-2"
}
module "vpc" {
  source               = "../../modules/aws/vpc"
  name                 = "example-vpc"
  vpc_cidr_block       = "10.0.0.0/16"
  azs                  = ["eu-west-2a", "eu-west-2b"]
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  tags = {
    Environment = "dev"
    Owner       = "coderco"
  }
  enable_flow_logs   = false
  enable_nat_gateway = false
}