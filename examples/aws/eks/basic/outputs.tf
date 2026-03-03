output "cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.eks_cluster_name
}

output "cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = module.eks.eks_cluster_endpoint
}

output "cluster_ca_certificate" {
  description = "EKS Cluster Certificate Authority Data"
  value       = module.eks.eks_cluster_ca_data
  sensitive   = true
}

output "oidc_issuer_url" {
  description = "OIDC Issuer URL for the EKS cluster"
  value       = module.eks.oidc_issuer_url
}
