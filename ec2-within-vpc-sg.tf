terraform {
 required_providers {
     aws = {
         source = "hashicorp/aws"
          version = "4.51.0"
        }
    }
}

provider "aws" {
    alias = "us-east-1"
    region = "us-east-1"
  # Configuration options
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example" {
  vpc_id     = "vpc-038eeebe1ba189101"
  cidr_block = "10.0.1.0/24"
}

resource "aws_security_group" "example" {
  name        = "kr55"
  description = "terraform ec2 with vpc security group"
  vpc_id      = "vpc-038eeebe1ba189101"

 ingress {
     from_port   = 22
     to_port     = 22
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
    }
}


resource "aws_instance" "example" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  subnet_id     = "subnet-011e2696481559e7d"
  vpc_security_group_ids = ["sg-09399880b66b9b5b4"]
}