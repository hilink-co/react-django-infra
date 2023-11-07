resource "aws_s3_bucket" "web-versioning" {
  bucket = "web-apps-infra"
  

  tags = {
    Name = "web-apps-infra"
  }
}

resource "aws_s3_bucket_cors_configuration" "web-versioning" {
  bucket = aws_s3_bucket.web-versioning.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_origins = ["*"]
    allowed_methods = ["GET", "PUT", "POST", "DELETE"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}