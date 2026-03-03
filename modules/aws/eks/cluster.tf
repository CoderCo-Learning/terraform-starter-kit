resource "aws_eks_cluster" "this" {
  name = var.name

  access_config {
    authentication_mode                         = var.authentication_mode
    bootstrap_cluster_creator_admin_permissions = var.bootstrap_cluster_creator_admin_permissions
  }

  role_arn = aws_iam_role.eks-cluster-role.arn
  version  = var.cluster_version

  vpc_config {
    subnet_ids = var.cluster_subnet_ids

    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access

  }

  upgrade_policy {
    support_type = var.upgrade_support_type
  }

  # Ensure that IAM Role permissions are created before and deleted
  # after EKS Cluster handling. Otherwise, EKS will not be able to
  # properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.cluster-attachment-policy,
  ]
}
