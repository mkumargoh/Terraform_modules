output "instance_id" {
  value = aws_instance.test_instance.id
}

output "private_key_path" {
  value = local_file.private_key.filename
}
output "availability_zone" {
  value = aws_instance.test_instance.availability_zone
}
output "instance_name" {
   value = aws_instance.test_instance.tags["Name"]
}
output "security_name" {
  value = aws_security_group.test_security
}
output "volume_name" {
  value = aws_instance.test_instance.volume_tags
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.test_security.id
}
