terraform {
  backend "s3" {
    bucket = "web-apps-infra"
    key    = "terraform/react-qa"
    region = "us-east-1"
  }
}
