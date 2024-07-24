variable "vpc_cidr_block" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet1_cidr_block" {
  type = string
}

variable "subnet1_name" {
  type = string
}

variable "subnet2_cidr_block" {
  type = string
}

variable "subnet2_name" {
  type = string
}

variable "subnet3_cidr_block" {
  type = string
}

variable "subnet3_name" {
  type = string
}

variable "igw_name" {
  type = string
}

variable "route_table_name" {
  type = string
}

variable "key_name" {
  type = string
}

# variable "public_key" {
#   type = string
# }

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "volume_size" {
  type    = number
  default = 50
}
# variable "ebs_volume_size" {
#     type = number
# }
# variable "volume_name" {
#   type = string
# }

# variable "device_name" {
#   type = string
# }
variable "instance_name" {
  type = string
}
# variable "volume_name" {
#   type = string   
# }
variable "availability_zone1" {
  type = string
}
variable "availability_zone2" {
  type = string
}
variable "availability_zone3" {
  type = string
}

# variable "vpc_id" {
#   description = "The VPC ID where the security group will be created"
#   type        = string
# }

variable "security_name" {
  description = "The name of the security group"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "List of egress rules"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
