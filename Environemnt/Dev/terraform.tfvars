vpc_cidr_block     = "192.168.0.0/16"
vpc_name           = "DevOps-VPC-Dev"
subnet1_cidr_block = "192.168.1.0/24"
subnet1_name       = "DevOps-Subnet1-Dev"
availability_zone1 = "ap-south-1a"
subnet2_cidr_block = "192.168.2.0/24"
subnet2_name       = "DevOps-Subnet2-Dev"
availability_zone2 = "ap-south-1b"
subnet3_cidr_block = "192.168.3.0/24"
subnet3_name       = "DevOps-Subnet3-Dev"
availability_zone3 = "ap-south-1c"
igw_name           = "DevOps-IGW-Dev"
route_table_name   = "DevOps-Route-Dev"
key_name           = "DevOps-Key"
instance_type      = "t2.micro"
volume_size        = 12
# ebs_volume_size    = 10
# volume_name        = "Test-Volume"
# device_name = "/dev/sdf"
instance_name = "DevOps-instance"
security_name = "DevOps-Security"
ingress_rules = [
{from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"]},
{from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"]},
{from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = [ "152.59.146.22/32" ]} ]

egress_rules = [ {
  from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = [ "0.0.0.0/0" ]
} ]
