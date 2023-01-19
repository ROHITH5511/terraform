terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.50.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_s3_bucket" "example" {
  bucket = "rk5566"
}

# OBJECT UPLOAD

 resource "aws_s3_bucket_object" "example" {
  bucket = "rk5566"
  key    = "rk5566/rootkey.txt"
  source = "C:/Users/Lenovo/OneDrive/Desktop/rootkey.txt"
}
 
 # STORAGE CLASSES LIFECYCLE 

resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = "rk5566"
  rule {
    id = "rule-1"
    status = "Enabled"
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = 90
      storage_class = "GLACIER"
    }
    transition {
      days          = 180
      storage_class = "DEEP_ARCHIVE"
    }
  } 
}