terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# configure the provider
provider "aws" {
  region = "eu-west-2"
}

# configure the instance type
resource "aws_instance" "test_instance" {
  ami           = "ami-03628db51da52eeaa"
  instance_type = "t2.micro"

  tags = {
    Name = "Test Instance"
  }
}

# Create a VPC
resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"
}
