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