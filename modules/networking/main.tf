resource "aws_vpc" "VPC" {
  cidr_block           = var.cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  enable_classiclink   = var.enable_classiclink

  tags = {
    Name = var.tags
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.VPC.id

  tags = {
    Name = "internet-gateway"
  }
}

resource "aws_subnet" "public_1" {
  availability_zone       = "eu-west-1a"
  vpc_id                  = aws_vpc.VPC.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.1.0/24"

  tags = {
    Name = "public_1-subnet"
  }
}

resource "aws_subnet" "public_2" {
  availability_zone       = "eu-west-1b"
  vpc_id                  = aws_vpc.VPC.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.2.0/24"

  tags = {
    Name = "public_2-subnet"
  }
}

resource "aws_route_table" "route-public" {
  vpc_id = aws_vpc.VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table-demo"
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.route-public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.route-public.id
}