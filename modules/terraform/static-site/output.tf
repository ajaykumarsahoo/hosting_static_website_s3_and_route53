# Output variable definitions

output "arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.terraform-static-website-aj.arn
}

output "name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.terraform-static-website-aj.id
}

output "domain" {
  description = "Domain name of the bucket"
  value       = aws_s3_bucket_website_configuration.example-config.website_domain
}

output "domain_endpoint" {
  description = "Domain_endpoint name of the bucket"
  value       = aws_s3_bucket_website_configuration.example-config.website_endpoint
}

output "ns_record" {
  description = "Name Server records for hosted zone"
  value       = aws_route53_zone.terraform-ajdolly.name_servers
}