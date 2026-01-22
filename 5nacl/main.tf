#create nacl for detroit_vpc_public_subnet
resource "aws_network_acl" "detroit_vpc_public_nacl" {
  vpc_id = var.detroit_vpc

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80 #access http port 8080
  }
  ingress {
    protocol   = "-1"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"  
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

    tags = {
        "Name" = "detroit_vpc_public_nacl"
    }
} 

#associate nacl with detroit_vpc_public_subnet
resource "aws_network_acl_association" "detroit_vpc_public_nacl_association" {
  subnet_id     = var.detroit_vpc_public_subnet
  network_acl_id = aws_network_acl.detroit_vpc_public_nacl.id
} 
#associate nacl with detroit_vpc_public2_subnet
resource "aws_network_acl_association" "detroit_vpc_public2_nacl_association" {
  subnet_id     = var.detroit_vpc_public2_subnet
  network_acl_id = aws_network_acl.detroit_vpc_public_nacl.id
} 
#==================================================================
#create nacl for detroit_vpc_private_subnet
resource "aws_network_acl" "detroit_vpc_private_nacl" {
  vpc_id = var.detroit_vpc
  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.1.0.0/16"
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.1.0.0/16"
    from_port  = 0
    to_port    = 0
  }
    tags = {
        "Name" = "detroit_vpc_private_nacl"
    }
}
#associate nacl with detroit_vpc_private_subnet
resource "aws_network_acl_association" "detroit_vpc_private_nacl_association" {
  subnet_id     = var.detroit_vpc_private_subnet
  network_acl_id = aws_network_acl.detroit_vpc_private_nacl.id
}
#associate nacl with detroit_vpc_private2_subnet
resource "aws_network_acl_association" "detroit_vpc_private2_nacl_association" {
  subnet_id     = var.detroit_vpc_private2_subnet
  network_acl_id = aws_network_acl.detroit_vpc_private_nacl.id
}
#==================================================================
#==================================================================
#==================================================================
#create nacl for chicago_vpc_public_subnet
resource "aws_network_acl" "chicago_vpc_public_nacl" {
  vpc_id = var.chicago_vpc

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80 #access http port 8080
  }
  ingress {
    protocol   = "-1"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"  
    from_port  = 0
    to_port    = 0
  } 
  
    tags = {
        "Name" = "chicago_vpc_public_nacl"
    } 
}
#associate nacl with chicago_vpc_public_subnet
resource "aws_network_acl_association" "chicago_vpc_public_nacl_association" {
  subnet_id     = var.chicago_vpc_public_subnet
  network_acl_id = aws_network_acl.chicago_vpc_public_nacl.id
} 
#associate nacl with chicago_vpc_public2_subnet
resource "aws_network_acl_association" "chicago_vpc_public2_nacl_association" {
  subnet_id     = var.chicago_vpc_public2_subnet
  network_acl_id = aws_network_acl.chicago_vpc_public_nacl.id
} 
#==================================================================
#create nacl for chicago_vpc_private_subnet
resource "aws_network_acl" "chicago_vpc_private_nacl" {
  vpc_id = var.chicago_vpc
  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.2.0.0/16"
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.2.0.0/16"
    from_port  = 0
    to_port    = 0
  }
    tags = {
        "Name" = "chicago_vpc_private_nacl"
    }
}
#associate nacl with chicago_vpc_private_subnet
resource "aws_network_acl_association" "chicago_vpc_private_nacl_association" {
  subnet_id     = var.chicago_vpc_private_subnet
  network_acl_id = aws_network_acl.chicago_vpc_private_nacl.id
}
#associate nacl with chicago_vpc_private2_subnet
resource "aws_network_acl_association" "chicago_vpc_private2_nacl_association" {
  subnet_id     = var.chicago_vpc_private2_subnet
  network_acl_id = aws_network_acl.chicago_vpc_private_nacl.id
}
#==================================================================