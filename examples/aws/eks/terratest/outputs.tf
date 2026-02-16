output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.test.id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = aws_subnet.public[*].id
}

output "cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.eks-cluster-name
}

output "cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = module.eks.eks-cluster-endpoint
}

output "cluster_ca_certificate" {
  description = "EKS Cluster Certificate Authority Data"
  value       = module.eks.eks-cluster-ca-data
  sensitive   = true
}

output "oidc_issuer_url" {
  description = "OIDC Issuer URL for the EKS cluster"
  value       = module.eks.oidc-issuer-url
}
