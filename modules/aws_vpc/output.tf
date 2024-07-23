output "vpc_id" {
  value = aws_vpc.example.id
}

output "subnet1_id" {
  value = aws_subnet.subnet1.id
}

output "subnet2_id" {
  value = aws_subnet.subnet2.id
}

output "subnet3_id" {
  value = aws_subnet.subnet3.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.test-igw.id
}

output "route_table_id" {
  value = aws_route_table.test-route.id
}

output "availability_zone1" {
  value = aws_subnet.subnet1.availability_zone_id
}
output "availability_zone2" {
  value = aws_subnet.subnet2.availability_zone_id
}
output "availability_zone3" {
  value = aws_subnet.subnet3.availability_zone_id
}