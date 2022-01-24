# GET DATA FROM AN AWS ROUTE53 ZONE
data "aws_route53_zone" "selected" {
  name         = var.domain_name
  private_zone = false
}

# AWS ROUTE53 CNAME RECORD
resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "www.${data.aws_route53_zone.selected.name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.alb_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.alb_distribution.hosted_zone_id
    evaluate_target_health = true
  }
}
