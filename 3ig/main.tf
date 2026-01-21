#create internet gatewaye for detroit_vpc
resource "aws_internet_gateway" "detroit_vpc_igw" {
  vpc_id = var.detroit_vpc
    tags = {
        "Name" = "detroit_vpc_igw"
    }
}
#create internet gatewaye for chicago_vpc
resource "aws_internet_gateway" "chicago_vpc_igw" {
  vpc_id = var.chicago_vpc
    tags = {
        "Name" = "chicago_vpc_igw"
    }
}

