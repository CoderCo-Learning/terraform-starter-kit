resource "aws_eks_cluster" "this" {
  name = var.name

  access_config {
    authentication_mode                         = var.authentication-mode
    bootstrap_cluster_creator_admin_permissions = var.bootstrap-cluster-creator-admin-permissions
  }

  role_arn = aws_iam_role.eks-cluster-role.arn
  version  = var.cluster-version

  vpc_config {
    subnet_ids = var.cluster-subnet-ids

    endpoint_private_access = var.endpoint-private-access
    endpoint_public_access  = var.endpoint-public-access

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
