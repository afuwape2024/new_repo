output "detroit_vpc" {
  value = aws_vpc.detroit_vpc.id
}
output "detroit_vpc_public_subnet" {
  value = aws_subnet.detroit_vpc_public_subnet.id
}
output "detroit_vpc_private_subnet" {
  value = aws_subnet.detroit_vpc_private_subnet.id
}
output "detroit_vpc_public2_subnet" {
  value = aws_subnet.detroit_vpc_public2_subnet.id
}
output "detroit_vpc_private2_subnet" {
  value = aws_subnet.detroit_vpc_private2_subnet.id
}