variable "name" {
  description = "Resource Name"
  type        = string
}

variable "authentication_mode" {
  description = "The authentication mode for the EKS cluster"
  type        = string
  default     = "API"
}

variable "bootstrap_cluster_creator_admin_permissions" {
  description = "Whether to grant bootstrap cluster creator admin permissions"
  type        = bool
  default     = true
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
}

variable "endpoint_private_access" {
  description = "Whether the EKS cluster API server is reachable from private endpoints"
  type        = bool
  default     = false
}

variable "endpoint_public_access" {
  description = "Whether the EKS cluster API server is reachable from public endpoints"
  type        = bool
  default     = true
}

variable "upgrade_support_type" {
  description = "The support type for the upgrade policy."
  type        = string
  default     = "STANDARD"
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
  default     = "node-group"
}

variable "desired_size" {
  description = "Desired number of nodes"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of nodes"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Minimum number of nodes"
  type        = number
  default     = 1
}

variable "instance_disk_size" {
  description = "Disk size for instances"
  type        = number
  default     = 20
}

variable "instance_types" {
  description = "List of instance types to be used within the cluster"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "capacity_type" {
  description = "Type of capacity for the EKS node group"
  type        = string
  default     = "ON_DEMAND"
}

variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) for the EKS node group. If not specified, EKS will choose the appropriate AMI based on cluster version"
  type        = string
  default     = null
}

variable "labels" {
  description = "Key-value map of Kubernetes labels to apply to the nodes in the node group"
  type        = map(string)
  default     = {}
}

variable "taints" {
  description = "List of taints to apply to the node group. Maximum of 50 taints per node group"
  type = list(object({
    key    = string
    value  = optional(string)
    effect = string
  }))
  default = []
}

variable "cluster_subnet_ids" {
  description = "List of subnet IDs for EKS cluster control plane"
  type        = list(string)
}

variable "node_group_subnet_ids" {
  description = "List of subnet IDs where the EKS node group will be deployed"
  type        = list(string)
}
