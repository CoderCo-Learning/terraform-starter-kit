output "oidc-issuer-url" {
  description = "The OIDC issuer URL for the EKS cluster"
  value       = aws_eks_cluster.this.identity[0].oidc[0].issuer
}

output "eks-cluster-endpoint" {
  description = "The endpoint for the EKS cluster API server"
  value       = aws_eks_cluster.this.endpoint
}

output "eks-cluster-ca-data" {
  description = "The certificate authority data for the EKS cluster"
  value       = aws_eks_cluster.this.certificate_authority[0].data
}

output "eks-cluster-name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.this.name
}
