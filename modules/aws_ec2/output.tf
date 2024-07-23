output "instance_id" {
  value = aws_instance.test_instance.id
}

output "private_key_path" {
  value = local_file.private_key.filename
}
