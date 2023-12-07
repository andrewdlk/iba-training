output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "EKS name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "SG Id attached to Cluster Control Plane"
  value       = module.eks.cluster_security_group_id
}
