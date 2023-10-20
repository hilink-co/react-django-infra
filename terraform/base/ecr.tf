resource "aws_ecr_repository" "main" {
  name                 = "web-apps-infra"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}