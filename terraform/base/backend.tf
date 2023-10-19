terraform {
  backend "s3" {
    bucket = "react-django-infra"
    key    = "terraform/base"
    region = "us-east-1"
  }
}
