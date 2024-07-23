# Generate SSH key pair
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Save the private key to local
resource "local_file" "private_key" {
  content  = tls_private_key.example.private_key_pem
  filename = "${path.module}/example.pem"
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

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_name
  }
}

resource "aws_instance" "test_instance" {
  ami                         = data.aws_ami.ubuntu.id
  vpc_security_group_ids      = [aws_security_group.test_security.id]
  instance_type               = var.instance_type
  associate_public_ip_address = true
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
