resource "aws_vpc" "ecs_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  enable_classiclink = false

  tags = {
    "Name" = "ecs-vpc"
  }
}

resource "aws_subnet" "ecs_subnet_public" {
  count = length(var.subnet_public_cidr)

  vpc_id = aws_vpc.ecs_vpc.id
  cidr_block = var.subnet_public_cidr[count.index]
  availability_zone = var.subnet_public_availability_zone[count.index]
  map_public_ip_on_launch = true
  
}

resource "aws_internet_gateway" "ecs_internet_gw" {
  vpc_id = aws_vpc.ecs_vpc.id

  tags = {
    "Name" = "ecs_internet_gw"
  }
}

resource "aws_route_table" "ecs_route_table" {
  vpc_id = aws_vpc.ecs_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ecs_internet_gw.id
  }

  tags = {
    Name = "ecs_route_table"
  }
}

resource "aws_route_table_association" "ecs_route_table_association" {
  count = length(var.subnet_public_cidr)

  subnet_id      = element(aws_subnet.ecs_subnet_public.*.id, count.index)
  route_table_id = aws_route_table.ecs_route_table.id
}