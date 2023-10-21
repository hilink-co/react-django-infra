terraform {
  backend "s3" {
    bucket = "web-apps-infra"
    key    = "terraform/qa"
    region = "us-east-1"
  }
}
