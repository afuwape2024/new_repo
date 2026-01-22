output "detroit_vpc_public_sg" {
  value = aws_security_group.detroit_vpc_public_sg.id
}
output "detroit_vpc_private_sg" {
  value = aws_security_group.detroit_vpc_private_sg.id
}

output "chicago_vpc_public_sg" {
  value = aws_security_group.chicago_vpc_public_sg.id
}
output "chicago_vpc_private_sg" {
  value = aws_security_group.chicago_vpc_private_sg.id
}