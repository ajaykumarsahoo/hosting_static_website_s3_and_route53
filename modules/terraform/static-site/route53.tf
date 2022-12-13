
resource "aws_route53_zone" "terraform-ajdolly" {
  name = var.domain_name
}

#Create an A record to map your domain name to the S3 bucket:
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.terraform-ajdolly.zone_id
  name = var.domain_name
  type = "A"
  
  alias {
    name = aws_s3_bucket_website_configuration.example-config.website_domain
    zone_id = aws_s3_bucket.terraform-static-website-aj.hosted_zone_id
    evaluate_target_health = false
  }
}