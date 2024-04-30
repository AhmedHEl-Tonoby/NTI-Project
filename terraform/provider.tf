provider "aws" {
  region  = "us-east-1"
  profile = "tonoby-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}