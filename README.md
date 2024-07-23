# Terraform Architectire for AWS 
your-terraform-project/
├── Environment/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfvars
│   ├── qa/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfvars
├── modules/
|   ├── aws_vpc
│   |   ├── main.tf
│   |   ├── variables.tf
│   |   ├── outputs.tf
|   ├── aws_ec2
│   |   ├── main.tf
│   |   ├── variables.tf
│   |   ├── outputs.tf
