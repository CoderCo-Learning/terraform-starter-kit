resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.node-group-name
  node_role_arn   = aws_iam_role.eks-node-group-role.arn
  subnet_ids      = var.node-group-subnet-ids

  scaling_config {
    desired_size = var.desired-size
    max_size     = var.max-size
    min_size     = var.min-size
  }

  disk_size      = var.instance-disk-size
  instance_types = var.instance-types
  capacity_type  = var.capacity-type
  ami_type       = var.ami-type
  labels         = var.labels

  dynamic "taint" {
    for_each = var.taints
    content {
      key    = taint.value.key
      value  = taint.value.value
      effect = taint.value.effect
    }
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}
