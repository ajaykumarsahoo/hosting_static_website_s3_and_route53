# Output definitions

output "website_bucket_arn" {
  description = "ARN of the bucket"
  value       = module.website.arn
}

output "website_bucket_name" {
  description = "Name (id) of the bucket"
  value       = module.website.name
}

output "website_bucket_domain" {
  description = "Domain name of the bucket"
  value       = module.website.domain
}

output "website_bucket_domain_enpoint" {
  description = "Domain_endpoint name of the bucket"
  value       = module.website.domain_endpoint
}

output "ns_hosted_zone" {
  description = "Name Servers records of hosted zone"
  value       = module.website.ns_record
}
