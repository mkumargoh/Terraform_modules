
# Generate SSH key pair
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Save the private key to local
resource "local_file" "private_key" {
  content  = tls_private_key.example.private_key_pem
  filename = "${path.module}/Devops.pem"
}

# Create an AWS key pair with public key
resource "aws_key_pair" "example" {
  key_name   = var.key_name
  public_key = tls_private_key.example.public_key_openssh
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-*"]
  }
}

resource "aws_security_group" "test_security" {
  vpc_id = var.vpc_id
  name = "${var.security_name}"
  dynamic "ingress" {
    for_each =  var.ingress_rules
    content {
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port = egress.value.from_port
      to_port = egress.value.to_port
      protocol = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
  tags = {
    Name = var.security_name
  }
}

resource "aws_instance" "test_instance" {
  ami                         = data.aws_ami.ubuntu.id
  vpc_security_group_ids      = [aws_security_group.test_security.id]
  instance_type               = var.instance_type
  associate_public_ip_address = false
  subnet_id                   = var.subnet_id
  key_name                    = aws_key_pair.example.key_name

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = "gp3"
    delete_on_termination = true
    tags = {
      Name = "${var.instance_name}-vol"
    }
  }
  tags = {
    Name = var.instance_name
  }
}
resource "aws_eip" "instance" {
   # instance = aws_instance.test_instance.id
    domain = "vpc"
}

resource "aws_eip_association" "eip_association" {
  instance_id = aws_instance.test_instance.id
  allocation_id = aws_eip.instance.id
}