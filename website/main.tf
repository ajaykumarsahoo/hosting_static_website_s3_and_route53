#Remote state S3 backend
terraform {
  backend "s3" {
    bucket         = "terraform-backend-statefile-dev"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
    profile        = "default"
  }
}
#Module block
module "website" {
  source      = "../modules/terraform/static-site"
  domain_name = var.domain_name
  aws_region  = "us-east-1"
}
