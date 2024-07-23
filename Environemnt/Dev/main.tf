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
}

module "ec2" {
  source      = "../../modules/aws_ec2"
  vpc_id      = module.network.vpc_id
  subnet_id   = module.network.subnet1_id
  key_name    = var.key_name
 # public_key  = var.public_key
  instance_type = var.instance_type
  volume_size   = var.volume_size
}