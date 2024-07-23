resource "aws_ebs_volume" "test" {
  availability_zone = var.availability_zone
  size = var.ebs_volume_size
  tags = {
    Name = var.volume_name
  }
}