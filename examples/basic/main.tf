terraform {
  required_version = ">= 1.2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.15.0"
    }
  }
}

module "ec2" {
source = "../../modules/aws/ec2"
# source = "git::https://github.com/CoderCo-Learning/terraform-starter-kit//modules/aws/ec2"

  instance_name      = var.instance_name
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = var.subnet_id
  security_group_ids = var.security_group_ids
  key_name           = var.key_name
}
