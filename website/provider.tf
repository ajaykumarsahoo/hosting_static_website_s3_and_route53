terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

#Provider block
provider "aws" {
  profile = "default"
  region  = var.aws_region
}