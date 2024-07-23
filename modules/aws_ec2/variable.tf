variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "volume_size" {
  type    = number
  default = 50
}

variable "instance_name" {
  type = string
}
variable "security_name" {
  type = string
}