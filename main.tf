#create vpc and one subnet
variable "cidr_block" {
  default = "10.0.0.0/16"
}
variable "public_subnet_cidr_block" {
  default = "10.0.0.0/20"
}

variable "private_subnet_cidr_block" {
  default = "10.0.128.0/20"
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
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
  }
}
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.justvpc.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet"
  }
} 

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.justvpc.id
  tags = {
    Name = "ig"
  }
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
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
#================================================================
resource "aws_network_acl" "public_nacl" {
  vpc_id = aws_vpc.justvpc.id

  egress {
    protocol   = "All traffic"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "All traffic"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  tags = {
    Name = "public_nacl"
  }
}

resource "aws_network_acl_association" "public_nacl_assoc" {
  subnet_id = aws_subnet.public_subnet.id
  network_acl_id = aws_network_acl.public_nacl.id
}

#================================================================


resource "aws_network_acl" "private_nacl" {
  vpc_id = aws_vpc.justvpc.id

  egress {
    protocol   = "All traffic"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "All traffic"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 22
    to_port    = 22
  }

  tags = {
    Name = "public_nacl"
  }
}

resource "aws_network_acl_association" "private_nacl_assoc" {
  subnet_id = aws_subnet.private_subnet.id
  network_acl_id = aws_network_acl.private_nacl.id
}

#================================================================
resource "aws_security_group" "public_instance_sg" {
  name        = "instance_sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.justvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "public_instance_sg"
  }
}

#================================================================
resource "aws_security_group" "private_instance_sg" {
  name        = "private_instance_sg"
  description = "Allow SSH"
  vpc_id      = aws_vpc.justvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "private_instance_sg"
  }
}

#connecting the nat gateway to the public subnet
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
} 
resource "aws_route_table" "private_rt_with_nat" {
  vpc_id = aws_vpc.justvpc.id

  route {
    cidr_block = "0.0.0.0/0"  
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = "private_rt_with_nat"
  }   
}
resource "aws_route_table_association" "private_rt_with_nat_assoc" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt_with_nat.id
}






