#create vpc and one subnet
variable "cidr_block" {
  default = "10.0.0.0/16"
}
variable "public_subnet_cidr_block" {
  default = "10.1.0.0/24"
}

variable "private_subnet_cidr_block" {
  default = "10.0.1.0/24"
}


resource "aws_vpc" "justvpc" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "justvpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.justvpc.id
  cidr_block        = var.public_subnet_cidr_block
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
  }
}
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.justvpc.id
  cidr_block        = var.private_subnet_cidr_block
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet"
  }
} 

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.justvpc.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.justvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
  tags = {
    Name = "public_rt"
  }   
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id = aws_subnet.public_subnet
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.justvpc.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }
  tags = {
    Name = "private_rt"
  }   
}

resource "aws_route_table_association" "private_rt_assoc" {
  subnet_id = aws_subnet.private_subnet
  route_table_id = aws_route_table.private_rt.id
}



