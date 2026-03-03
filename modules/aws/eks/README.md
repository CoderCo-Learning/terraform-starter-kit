# EKS Module - V1.0.0

This module creates an Amazon EKS (Elastic Kubernetes Service) cluster with a managed node group, including all necessary IAM roles and policies.

## Features

- EKS cluster with configurable authentication mode
- Managed node group with configurable scaling settings
- Configurable public and private endpoint access
- IAM roles and policies for cluster and node group
- Support for multiple instance types and capacity types (On-Demand/Spot)
- Support for Kubernetes labels for pod scheduling (nodeSelector, nodeAffinity)
- Support for taints to control pod placement
- Configurable upgrade policy support
- High availability deployment across multiple subnets
- Comprehensive tagging via provider default_tags

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.12.2 |
| aws | >= 6.24.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | Name of the EKS cluster | `string` | n/a | yes |
| authentication-mode | The authentication mode for the EKS cluster | `string` | `"API"` | no |
| bootstrap-cluster-creator-admin-permissions | Whether to grant bootstrap cluster creator admin permissions | `bool` | `true` | no |
| cluster-version | EKS cluster version | `string` | n/a | yes |
| endpoint-private-access | Whether the EKS cluster API server is reachable from private endpoints | `bool` | `false` | no |
| endpoint-public-access | Whether the EKS cluster API server is reachable from public endpoints | `bool` | `true` | no |
| upgrade_support_type | The support type for the upgrade policy | `string` | `"STANDARD"` | no |
| node-group-name | The name of the EKS node group | `string` | `"node-group"` | no |
| desired-size | Desired number of nodes in the node group | `number` | `2` | no |
| max-size | Maximum number of nodes in the node group | `number` | `3` | no |
| min-size | Minimum number of nodes in the node group | `number` | `1` | no |
| instance-disk-size | Disk size in GB for node group instances | `number` | `20` | no |
| instance-types | List of instance types to be used within the node group | `list(string)` | `["t3.medium"]` | no |
| capacity-type | Type of capacity for the EKS node group (ON_DEMAND or SPOT) | `string` | `"ON_DEMAND"` | no |
| ami-type | Type of Amazon Machine Image (AMI) for the EKS node group. If not specified, EKS will automatically select the appropriate AMI based on cluster version. Valid values: AL2023_x86_64_STANDARD, AL2023_ARM_64_STANDARD, AL2_x86_64, AL2_ARM_64, BOTTLEROCKET_ARM_64, BOTTLEROCKET_x86_64, and others | `string` | `null` | no |
| labels | Key-value map of Kubernetes labels to apply to nodes. Used for pod scheduling with nodeSelector and nodeAffinity | `map(string)` | `{}` | no |
| taints | List of taints to apply to the node group. Each taint requires key and effect, value is optional. Valid effects: NO_SCHEDULE, NO_EXECUTE, PREFER_NO_SCHEDULE | `list(object)` | `[]` | no |
| cluster-subnet-ids | List of subnet IDs for EKS cluster control plane | `list(string)` | n/a | yes |
| node-group-subnet-ids | List of subnet IDs where the EKS node group will be deployed | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| oidc-issuer-url | The OIDC issuer URL for the EKS cluster (used for IAM roles for service accounts) |
| eks-cluster-endpoint | The endpoint for the EKS cluster API server |
| eks-cluster-ca-data | The certificate authority data for the EKS cluster |
| eks-cluster-name | The name of the EKS cluster |

## Examples

See [examples/](examples/) directory for complete examples.

## Notes

- **Managed node groups only** - This module currently only supports managed node groups. Fargate and self-managed nodes are not supported as of now
- **Subnets are required** - You must create and provide subnet IDs for both the EKS cluster control plane and node groups. The module does not create VPCs or subnets. All subnets must be from the same VPC. Ensure your subnets have the appropriate EKS tags (see below) configured for load balancer provisioning to work correctly
- **Subnet tags** - Subnets must be tagged with `kubernetes.io/cluster/<cluster-name>` set to either `shared` (if the subnet is used by multiple clusters) or `owned` (if dedicated to this cluster). Public subnets need `kubernetes.io/role/elb = 1` for public load balancers. Private subnets need `kubernetes.io/role/internal-elb = 1` for internal load balancers
- **Security groups not required** - AWS EKS automatically creates and manages a cluster security group for communication between the control plane and worker nodes. You do not need to create or provide security groups
- All resources are automatically tagged with `ManagedBy` and `Module` tags via provider default_tags
- The module creates IAM roles for the EKS cluster and node group

## Resources Created

- `aws_eks_cluster` - EKS cluster
- `aws_eks_node_group` - Managed node group
- `aws_iam_role` (x2) - IAM roles for cluster and node group
- `aws_iam_role_policy_attachment` (x4) - Policy attachments for EKS cluster and node group
