terraform {
  backend "s3" {
    bucket = "web-apps-infra"
    key    = "terraform/base"
    region = "us-east-1"
  }
}
