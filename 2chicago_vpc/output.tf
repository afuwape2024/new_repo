output "chicago_vpc" {
  value = aws_vpc.chicago_vpc_vpc.id
}
output "chicago_vpc_public_subnet" {
  value = aws_subnet.chicago_vpc_public_subnet.id
}
output "chicago_vpc_private_subnet" {
  value = aws_subnet.chicago_vpc_private_subnet.id
}
output "chicago_vpc_public2_subnet" {
  value = aws_subnet.chicago_vpc_public2_subnet.id
}
output "chicago_vpc_private2_subnet" {
  value = aws_subnet.chicago_vpc_private2_subnet.id
}