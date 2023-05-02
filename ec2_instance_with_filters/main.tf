terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

# aws ec2 describe-images --region eu-west-2 --owners 309956199498 --filters "Name=name,Values=RHEL-9.0.0_HVM-*" "Name=architecture,Values=x86_64"
data "aws_ami" "rhel" {
  most_recent = true
  owners = ["309956199498"]  # Red Hat

  filter {
    name    = "name"
    values  = ["RHEL-9.0.0_HVM-*"]
  }

  filter {
    name    = "architecture"
    values  = ["x86_64"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.rhel.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
