output "detroit_to_chicago_public" {
  value = aws_route.detroit_to_chicago_private
}
output "detroit_to_chicago_private" {
  value = aws_route.detroit_to_chicago_private    
}
output "chicago_to_detroit_public" {
  value = aws_route.chicago_to_detroit_public
}
output "chicago_to_detroit_private" {
  value = aws_route.chicago_to_detroit_private    
}