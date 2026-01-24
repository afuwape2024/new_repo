#create a VPC peering connection between two VPCs
resource "aws_vpc_peering_connection" "chicago_detroit_peer" {
  vpc_id        = var.detroit_vpc
  peer_vpc_id   = var.chicago_vpc
  auto_accept   = true
    tags = {
        Name = "detroit-chicago-peering"
    }       
}

#update route tables in detroit VPC to route traffic to chicago VPC via the peering connection
resource "aws_route" "detroit_to_chicago_public" {
  depends_on = [ aws_vpc_peering_connection.chicago_detroit_peer ]
  route_table_id          = var.detroit_vpc_public_route_table
  destination_cidr_block  = "10.2.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.chicago_detroit_peer.id
}   
resource "aws_route" "detroit_to_chicago_private" {
  depends_on = [ aws_vpc_peering_connection.chicago_detroit_peer ]
  route_table_id          = var.detroit_vpc_private_route_table 
  destination_cidr_block  = "10.2.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.chicago_detroit_peer.id
}

#update route tables in chicago VPC to route traffic to detroit VPC via the peering connection
resource "aws_route" "chicago_to_detroit_public" {
  depends_on = [ aws_vpc_peering_connection.chicago_detroit_peer ]
  route_table_id          = var.chicago_vpc_public_route_table
  destination_cidr_block  = "10.1.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.chicago_detroit_peer.id
}   
resource "aws_route" "chicago_to_detroit_private" {
  depends_on = [ aws_vpc_peering_connection.chicago_detroit_peer ]
  route_table_id          = var.chicago_vpc_private_route_table
  destination_cidr_block  = "10.1.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.chicago_detroit_peer.id
}
