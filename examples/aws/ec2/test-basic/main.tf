provider "aws" {
  region = var.region
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

data "aws_subnets" "default" {
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

module "ec2" {
  source = "../../../../modules/aws/ec2"

  instance_name       = "terratest-ec2"
  instance_type       = "t3.micro"
  ami_id              = data.aws_ami.amazon_linux.id
  subnet_id           = data.aws_subnets.default.ids[0]
  security_group_ids  = []
  key_name            = null
}
