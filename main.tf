locals {
  region = "ap-northeast-2"
}

variable "vpc_name" {
  type        = string
  default     = "jys-vpc"
  description = "생성되는 VPC의 이름"
}

provider "aws" {
  region = local.region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = "10.0.0.0/26"

  azs             = ["ap-northeast-2a", "ap-northeast-2c"]
  private_subnets = ["10.0.0.0/28", "10.0.0.32/28"]
  public_subnets  = ["10.0.0.16/28", "10.0.0.48/28"]

  private_subnet_names = ["jys-vpc-private-subnet-01", "jys-vpc-private-subnet-02"]
  public_subnet_names  = ["jys-vpc-public-subnet-01", "jys-vpc-public-subnet-02"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "aws" {
  source = "./aws"

  name = "jys-aws"
}

output "id" {
  value = module.aws.id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
