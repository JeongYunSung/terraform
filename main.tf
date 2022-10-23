provider "aws" {
  region = "ap-northeast-2"
}

data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}