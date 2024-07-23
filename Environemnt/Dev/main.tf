terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}
module "network" {
  source = "../../modules/aws_vpc"
  igw_name = var.igw_name
  subnet1_cidr_block = var.subnet1_cidr_block
  subnet2_cidr_block = var.subnet2_cidr_block
  route_table_name = var.route_table_name
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name = var.vpc_name
  subnet1_name = var.subnet1_name
  subnet2_name = "${var.subnet2_name}"
  subnet3_name = var.subnet3_name
  subnet3_cidr_block = var.subnet3_cidr_block
  availability_zone1 = var.availability_zone1
  availability_zone2 = var.availability_zone2
  availability_zone3 = var.availability_zone3
}

module "ebs_volume" {
    source = "../../modules/aws_ebs"
    ebs_volume_size = var.ebs_volume_size
    volume_name = var.volume_name
    availability_zone = module.ec2.availability_zone
}
module "ec2" {
  source      = "../../modules/aws_ec2"
  vpc_id      = module.network.vpc_id
  subnet_id   = module.network.subnet1_id
  key_name    = var.key_name
 # public_key  = var.public_key
  instance_type = var.instance_type
  volume_size   = var.volume_size
  instance_name = var.instance_name
  security_name = var.security_name
}

# Define the additional EBS volume
# resource "aws_ebs_volume" "additional_volume" {
#   availability_zone = var.availability_zone
#   size              = var.ebs_volume_size
#   tags = {
#     Name = var.volume_name
#   }
# }

# Attach the additional EBS volume to the EC2 instance
resource "aws_volume_attachment" "ebs_attachment" {
  device_name = var.device_name
  volume_id   = module.ebs_volume.volume_id
  instance_id = module.ec2.instance_id
  depends_on = [ module.ec2, module.ebs_volume ]
}