resource "aws_vpc" "detroit_vpc" {
  cidr_block = var.detroit_vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    "Name" = "detroit_vpc"
  }
}

resource "aws_subnet" "detroit_vpc_public_subnet" {
  vpc_id            = aws_vpc.detroit_vpc.id
  cidr_block        = var.detroit_vpc_public_subnet_cidr_block
  availability_zone = var.detroit_vpc_availability_zone_2a
  map_public_ip_on_launch = true

  tags = {
    "Name" = "detroit_vpc_public_subnet"
  }
}
resource "aws_subnet" "detroit_vpc_private_subnet" {
  vpc_id            = aws_vpc.detroit_vpc.id
  cidr_block        = var.detroit_vpc_private_subnet_cidr_block
  availability_zone = var.detroit_vpc_availability_zone_2a
  map_public_ip_on_launch = false

  tags = {
    "Name" = "detroit_vpc_private_subnet"
  }
} 
#============================================================================
resource "aws_subnet" "detroit_vpc_public2_subnet" {
  vpc_id            = aws_vpc.detroit_vpc.id
  cidr_block        = var.detroit_vpc_public2_subnet_cidr_block
  availability_zone = var.detroit_vpc_availability_zone_2b
  map_public_ip_on_launch = true

  tags = {
    "Name" = "detroit_vpc_public2_subnet"
  }
}
resource "aws_subnet" "detroit_vpc_private2_subnet" {
  vpc_id            = aws_vpc.detroit_vpc.id
  cidr_block        = var.detroit_vpc_private2_subnet_cidr_block
  availability_zone = var.detroit_vpc_availability_zone_2b
  map_public_ip_on_launch = false

  tags = {
    "Name" = "detroit_vpc_private2_subnet"
  }
} 