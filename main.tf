#create vpc and one subnet

resource "aws_vpc" "justvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "justvpc"
  }
}