# https://github.com/terraform-module/terraform-aws-github-oidc-provider
output "github_oidc_provider_arn" {
  description = "The ARN assigned by AWS for this provider"
  value       = module.github-oidc.oidc_provider_arn
}

output "github_oidc_provider_role" {
  description = "The ARN assigned by AWS for this provider"
  value       = module.github-oidc.oidc_role
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository#attribute-reference
output "ecr_respository_url" {
  description = "The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)"
  value = aws_ecr_repository.main.repository_url
}