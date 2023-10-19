# https://github.com/terraform-aws-modules/terraform-aws-rds/blob/master/examples/complete-mysql/outputs.tf
output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.db.db_instance_address
}

# # https://github.com/terraform-aws-modules/terraform-aws-eks/blob/v19.17.2/examples/complete/outputs.tf
output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster"
  value       = module.eks.cluster_arn
}

output "cluster_endpoint" {
  description = "Endpoint for your Kubernetes API server"
  value       = module.eks.cluster_endpoint
}
