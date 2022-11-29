terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.42.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}
resource "aws_instance""terraform_instance" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
}

