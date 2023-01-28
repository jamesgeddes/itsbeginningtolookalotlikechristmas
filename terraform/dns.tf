resource "aws_route53_zone" "primary" {
  name = var.service_domain
}

resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.service_domain
  type    = "A"

  alias {
    evaluate_target_health = false
    name                   = aws_s3_bucket_website_configuration.site.website_domain
    zone_id                = aws_s3_bucket.public_bucket.hosted_zone_id
  }
}
