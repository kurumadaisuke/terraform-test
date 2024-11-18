resource "aws_s3_bucket" "static_content_bucket" {
  bucket = "static-content-test-kurumadaisuke"

  tags = {
    Name = "test-bucket"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "static_content_encryption" {
  bucket = aws_s3_bucket.static_content_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_website_configuration" "static_content_website" {
  bucket = aws_s3_bucket.static_content_bucket.bucket

  index_document {
    suffix = "sorry.html"
  }
}
