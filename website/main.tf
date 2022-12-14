/*Before running this backend block we need to create S3 bucket and DynamoDb table. 
Then run "$terraform init" and then "$terraform apply" to initialize the s3 backened. */

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
