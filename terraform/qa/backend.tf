terraform {
  backend "s3" {
    bucket = "react-django-infra"
    key    = "terraform/qa"
    region = "us-east-1"
  }
}
