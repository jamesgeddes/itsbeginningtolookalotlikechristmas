data "aws_route53_zone" "site" {
  name         = var.service_domain
  private_zone = false
}