output "detroit_vpc_public_nacl" {
  value = aws_network_acl.detroit_vpc_public_nacl.id
}
output "detroit_vpc_private_nacl" {
  value = aws_network_acl.detroit_vpc_private_nacl.id
}
output "chicago_vpc_public_nacl" {
  value = aws_network_acl.chicago_vpc_public_nacl.id
}
output "chicago_vpc_private_nacl" {
  value = aws_network_acl.chicago_vpc_private_nacl.id  
}

#===========================================================
#===========================================================
#===========================================================
