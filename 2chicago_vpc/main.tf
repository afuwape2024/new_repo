resource "aws_vpc" "chicago_vpc_vpc" {
  cidr_block = var.chicago_vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    "Name" = "chicago_vpc"
  }
}

resource "aws_subnet" "chicago_vpc_public_subnet" {
  vpc_id            = aws_vpc.chicago_vpc_vpc.id
  cidr_block        = var.chicago_vpc_public_subnet_cidr_block
  availability_zone = var.chicago_vpc_availability_zone_2a
  map_public_ip_on_launch = true

  tags = {
    "Name" = "chicago_vpc_public_subnet"
  }
}
resource "aws_subnet" "chicago_vpc_private_subnet" {
  vpc_id            = aws_vpc.chicago_vpc_vpc.id
  cidr_block        = var.chicago_vpc_private_subnet_cidr_block
  availability_zone = var.chicago_vpc_availability_zone_2a
  map_public_ip_on_launch = false

  tags = {
    "Name" = "chicago_vpc_private_subnet"
  }
} 
#============================================================================
resource "aws_subnet" "chicago_vpc_public2_subnet" {
  vpc_id            = aws_vpc.chicago_vpc_vpc.id
  cidr_block        = var.chicago_vpc_public2_subnet_cidr_block
  availability_zone = var.chicago_vpc_availability_zone_2b
  map_public_ip_on_launch = true

  tags = {
    "Name" = "chicago_vpc_public2_subnet"
  }
}
resource "aws_subnet" "chicago_vpc_private2_subnet" {
  vpc_id            = aws_vpc.chicago_vpc_vpc.id
  cidr_block        = var.chicago_vpc_private2_subnet_cidr_block
  availability_zone = var.chicago_vpc_availability_zone_2b
  map_public_ip_on_launch = false

  tags = {
    "Name" = "chicago_vpc_private2_subnet"
  }
} 