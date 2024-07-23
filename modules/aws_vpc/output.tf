output "vpc_id" {
  value = aws_vpc.example.id
}

output "subnet1_id" {
  value = aws_subnet.subnet1.id
}

output "subnet2_id" {
  value = aws_subnet.subnet2.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.test-igw.id
}

output "route_table_id" {
  value = aws_route_table.test-route.id
}
