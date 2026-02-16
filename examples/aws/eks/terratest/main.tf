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

# VPC
resource "aws_vpc" "test" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

# Internet Gateway
resource "aws_internet_gateway" "test" {
  vpc_id = aws_vpc.test.id
}

# Public Subnets
resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.test.id
  cidr_block              = "10.0.${count.index + 1}.0/24"
  availability_zone       = "eu-west-2${count.index == 0 ? "a" : "b"}"
  map_public_ip_on_launch = true

  tags = {
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = "1"
  }
}

# Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test.id
  }
}

# Route Table Associations
resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Private Subnets
resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.test.id
  cidr_block        = "10.0.${count.index + 10}.0/24"
  availability_zone = "eu-west-2${count.index == 0 ? "a" : "b"}"

  tags = {
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"        = "1"
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"

  depends_on = [aws_internet_gateway.test]
}

# NAT Gateway
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "test-eks-nat-gateway"
  }

  depends_on = [aws_internet_gateway.test]
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "private-route-table"
  }
}

# Private Route Table Associations
resource "aws_route_table_association" "private" {
  count          = 2
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

# Create EKS cluster
module "eks" {
  source = "../../../../modules/aws/eks"

  name                    = "test-eks-cluster"
  cluster-version         = "1.34"
  cluster-subnet-ids      = concat(aws_subnet.public[*].id, aws_subnet.private[*].id)
  node-group-subnet-ids   = aws_subnet.private[*].id
  endpoint-private-access = true
  endpoint-public-access  = true

}
