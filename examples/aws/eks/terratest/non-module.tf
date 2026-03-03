resource "aws_vpc" "test" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_internet_gateway" "test" {
  vpc_id = aws_vpc.test.id
}

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

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test.id
  }
}

resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

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

resource "aws_eip" "nat" {
  domain = "vpc"

  depends_on = [aws_internet_gateway.test]
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "test-eks-nat-gateway"
  }

  depends_on = [aws_internet_gateway.test]
}

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

resource "aws_route_table_association" "private" {
  count          = 2
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
