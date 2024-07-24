module "ec2" {
  source      = "../../modules/aws_ec2"
  vpc_id      = module.network.vpc_id
  subnet_id   = module.network.subnet1_id
  key_name    = var.key_name
 # public_key  = var.public_key
  instance_type = var.instance_type
  volume_size   = var.volume_size
  instance_name = "${var.instance_name}"
  security_name = var.security_name
  egress_rules = var.egress_rules
  ingress_rules = var.ingress_rules
}

# module "ebs_volume" {
#     source = "../../modules/aws_ebs"
#     ebs_volume_size = var.ebs_volume_size
#     volume_name = var.volume_name
#     availability_zone = module.ec2.availability_zone
# }

# Attach the additional EBS volume to the EC2 instance
# resource "aws_volume_attachment" "ebs_attachment" {
#   device_name = var.device_name
#   volume_id   = module.ebs_volume.volume_id
#   instance_id = module.ec2.instance_id
#   depends_on = [ module.ec2, module.ebs_volume ]
# }