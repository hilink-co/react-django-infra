resource "aws_ecr_repository" "main" {
  name                 = "react-django-infra"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}