output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet1_id" {
  value = module.network.subnet1_id
}

output "subnet2_id" {
  value = module.network.subnet2_id
}
output "subnet3_id" {
  value = module.network.subnet3_id
}
output "internet_gateway_id" {
  value = module.network.internet_gateway_id
}

output "route_table_id" {
  value = module.network.route_table_id
}

output "instance_id" {
  value = module.ec2.instance_id
}
output "security_name" {
  value = module.ec2.security_name
}
output "volume_name" {
  value = module.ec2.volume_name
}

output "private_key_path" {
  value = module.ec2.private_key_path
}

output "instance_name" {
  value = module.ec2.instance_name
}