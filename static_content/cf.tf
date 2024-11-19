resource "aws_cloudfront_distribution" "static_content_distribution" {
  origin {
    domain_name = aws_s3_bucket.static_content_bucket.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.static_content_bucket.bucket_regional_domain_name
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.static_content_access_identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  comment             = "Static Content Distribution"
  default_root_object = "sorry.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = aws_s3_bucket.static_content_bucket.bucket_regional_domain_name

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
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
