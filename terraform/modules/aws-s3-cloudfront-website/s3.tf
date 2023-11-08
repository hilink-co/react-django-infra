resource "aws_s3_bucket" "main" {
  # provider = aws.main
  bucket   = var.fqdn
  # policy   = data.aws_iam_policy_document.bucket_policy.json

  website {
    index_document = var.index_document
    error_document = var.error_document
    routing_rules  = var.routing_rules
  }

  force_destroy = var.force_destroy

  tags = merge(
    var.tags,
    {
      "Name" = var.fqdn
    },
  )
}

resource "aws_s3_bucket_cors_configuration" "main" {
  bucket = aws_s3_bucket.main.id  

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }  
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "main" {
  bucket = aws_s3_bucket.main.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
  depends_on = [aws_s3_bucket_public_access_block.main]
}

resource "aws_s3_bucket_acl" "main" {
  depends_on = [aws_s3_bucket_ownership_controls.main]

  bucket = aws_s3_bucket.main.id
  acl    = "private"
}

resource "aws_s3_bucket_policy" "main" {
    bucket = aws_s3_bucket.main.id
    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Principal = "*"
        Action = [
          "s3:*",
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.fqdn}",
          "arn:aws:s3:::${var.fqdn}/*"
        ]
      },
      {
        Sid = "PublicReadGetObject"
        Principal = "*"
        Action = [
          "s3:GetObject",
        ]
        Effect   = "Allow"
        Resource = [
          "arn:aws:s3:::${var.fqdn}",
          "arn:aws:s3:::${var.fqdn}/*"
        ]
      },
    ]
  })
  
  depends_on = [aws_s3_bucket_public_access_block.main]
}



# data "aws_iam_policy_document" "bucket_policy" {
#   # provider = aws.main

#   statement {
#     sid = "AllowedIPReadAccess"

#     actions = [
#       "s3:GetObject",
#     ]

#     resources = [
#       "arn:aws:s3:::${var.fqdn}/*",
#     ]

#     condition {
#       test     = "IpAddress"
#       variable = "aws:SourceIp"

#       values = var.allowed_ips
#     }

#     principals {
#       type        = "*"
#       identifiers = ["*"]
#     }
#   }

#   statement {
#     sid = "AllowCFOriginAccess"

#     actions = [
#       "s3:GetObject",
#     ]

#     resources = [
#       "arn:aws:s3:::${var.fqdn}/*",
#     ]

#     condition {
#       test     = "StringEquals"
#       variable = "aws:UserAgent"

#       values = [
#         var.refer_secret,
#       ]
#     }

#     principals {
#       type        = "*"
#       identifiers = ["*"]
#     }
#   }
# }