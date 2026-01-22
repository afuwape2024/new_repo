#create rout table for detroit_vpc_public_subnet, with nat and private subnet
resource "aws_route_table" "detroit_vpc_public_route_table" {
  vpc_id = var.detroit_vpc  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.detroit_vpc_igw
    }
    tags = {
        "Name" = "detroit_vpc_public_route_table"
    }
}

#associate detroit_vpc_public_subnet with detroit_vpc_public_route_table
resource "aws_route_table_association" "detroit_vpc_public_route_table_association" {
  subnet_id      = var.detroit_vpc_public_subnet
  route_table_id = aws_route_table.detroit_vpc_public_route_table.id
}

#associate detroit_vpc_public2_subnet with detroit_vpc_public2_route_table
resource "aws_route_table_association" "detroit_vpc_public2_route_table_association" {
  subnet_id      = var.detroit_vpc_public2_subnet
  route_table_id = aws_route_table.detroit_vpc_public_route_table.id
}


#create elastic ip for nat gateway
resource "aws_eip" "detroit_eip" {
    depends_on = [ aws_route_table.detroit_vpc_public_route_table ]
  domain = "vpc"
    tags = {
        "Name" = "detroit_eip"
    }
}
#create nat gateway for detroit_vpc_private_subnet
resource "aws_nat_gateway" "detroit_nat_gw1" {
  allocation_id = aws_eip.detroit_eip.id
  subnet_id     = var.detroit_vpc_public_subnet
    tags = {
        "Name" = "detroit_nat_gw1"
    }
}  

#create route table for detroit_vpc_private_subnet
resource "aws_route_table" "detroit_vpc_private_route_table" {
  vpc_id = var.detroit_vpc
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.detroit_nat_gw1.id
    }
    tags = {
        "Name" = "detroit_vpc_private_route_table"
    }
}
#create rout table for detroit_vpc_private_subnet
resource "aws_route_table_association" "detroit_vpc_private_route_table_association" {
  subnet_id      = var.detroit_vpc_private_subnet
  route_table_id = aws_route_table.detroit_vpc_private_route_table.id
}

resource "aws_route_table_association" "detroit_vpc_private2_route_table_association" {
  subnet_id      = var.detroit_vpc_private2_subnet
  route_table_id = aws_route_table.detroit_vpc_private_route_table.id
}
#==================================================================

#==================================================================
#==================================================================
#==================================================================
#create rout table for chicago_vpc_public_subnet, with nat and private subnet
resource "aws_route_table" "chicago_vpc_public_route_table" {
  vpc_id = var.chicago_vpc
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.chicago_vpc_igw
    }
    tags = {
        "Name" = "chicago_vpc_public_route_table"
    }
}

#associate chicago_vpc_public_subnet with chicago_vpc_public_route_table
resource "aws_route_table_association" "chicago_vpc_public_route_table_association" {
  subnet_id      = var.chicago_vpc_public_subnet
  route_table_id = aws_route_table.chicago_vpc_public_route_table.id
}

#associate chicago_vpc_public2_subnet with chicago_vpc_public2_route_table
resource "aws_route_table_association" "chicago_vpc_public2_route_table_association" {
  subnet_id      = var.chicago_vpc_public2_subnet
  route_table_id = aws_route_table.chicago_vpc_public_route_table.id
}


#create elastic ip for nat gateway
resource "aws_eip" "chicago_eip" {
    depends_on = [ aws_route_table.chicago_vpc_public_route_table ]
  domain = "vpc"
    tags = {
        "Name" = "chicago_eip"
    }
}
#create nat gateway for chicago_vpc_private_subnet
resource "aws_nat_gateway" "chicago_nat_gw1" {
  allocation_id = aws_eip.chicago_eip.id
  subnet_id     = var.chicago_vpc_public_subnet
    tags = {
        "Name" = "chicago_nat_gw1"
    }
}  

#create route table for chicago_vpc_private_subnet
resource "aws_route_table" "chicago_vpc_private_route_table" {
  vpc_id = var.chicago_vpc
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.chicago_nat_gw1.id
    }
    tags = {
        "Name" = "chicago_vpc_private_route_table"
    }
}
#create rout table for chicago_vpc_private_subnet
resource "aws_route_table_association" "chicago_vpc_private_route_table_association" {
  subnet_id      = var.chicago_vpc_private_subnet
  route_table_id = aws_route_table.chicago_vpc_private_route_table.id
}

resource "aws_route_table_association" "chicago_vpc_private2_route_table_association" {
  subnet_id      = var.chicago_vpc_private2_subnet
  route_table_id = aws_route_table.chicago_vpc_private_route_table.id
}
