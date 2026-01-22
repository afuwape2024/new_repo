#==================================================================
#create security group for detroit_vpc
resource "aws_security_group" "detroit_vpc_public_sg" {
  name        = "detroit_vpc_public_sg"
  description = "Security group for detroit_vpc"
    vpc_id      = var.detroit_vpc
    
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
        "Name" = "detroit_vpc_public_sg"
    }
}
#==================================================================
#==================================================================
#create security group for private detroit_instances
resource "aws_security_group" "detroit_vpc_private_sg" {
  name        = "detroit_vpc_private_sg"
  description = "Security group for private detroit_instances"
    vpc_id      = var.detroit_vpc   
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
        "Name" = "detroit_vpc_private_sg"
    }
}
#==================================================================
#==================================================================
#==================================================================
#create security group for chicago_vpc
resource "aws_security_group" "chicago_vpc_public_sg" {
  name        = "chicago_vpc_public_sg"
  description = "Security group for chicago_vpc"
    vpc_id      = var.chicago_vpc   
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
        "Name" = "chicago_vpc_public_sg"
    }
}
#==================================================================
#==================================================================
#create security group for private chicago_instances
resource "aws_security_group" "chicago_vpc_private_sg" {
  name        = "chicago_vpc_private_sg"
  description = "Security group for private chicago_instances"
    vpc_id      = var.chicago_vpc   
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
        "Name" = "chicago_vpc_private_sg"
    }
}
#==================================================================