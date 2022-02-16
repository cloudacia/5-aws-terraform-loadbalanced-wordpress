
###############################################
#  AWS CLOUDFRONT DISTRIBUTION                #
###############################################
resource "aws_cloudfront_distribution" "alb_distribution" {
  depends_on = [
    aws_lb.alb01
  ]

  enabled = true

  origin {
    domain_name = aws_lb.alb01.dns_name
    origin_id   = aws_lb.alb01.id

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_protocol_policy   = "http-only"
      origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
      origin_keepalive_timeout = "5"
      origin_read_timeout      = "30"
    }
  }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_lb.alb01.id
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "allow-all"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
