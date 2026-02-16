# EKS Terratest Example

This example creates a complete, minimal EKS environment for automated testing with Terratest.

## Purpose

This example is specifically designed for automated testing and creates all required infrastructure from scratch without using any modules except the EKS module being tested.

## File Structure

- **main.tf** - Terraform/provider configuration and EKS module declaration
- **non-module.tf** - All non-module resources (VPC, subnets, internet gateway, NAT gateway, route tables)
- **outputs.tf** - Output values for terratest validation

## What Gets Created

**VPC Resources:**
- 1 VPC (`10.0.0.0/16`)
- 2 Public subnets (`10.0.1.0/24`, `10.0.2.0/24`) across 2 AZs
- 2 Private subnets (`10.0.10.0/24`, `10.0.11.0/24`) across 2 AZs
- Internet Gateway
- NAT Gateway with Elastic IP
- Public route table with internet gateway routes
- Private route table with NAT gateway routes
- Proper EKS subnet tags

**EKS Resources:**
- EKS cluster (version 1.34) with control plane in both public and private subnets
- Managed node group (2 nodes, t3.medium) deployed in private subnets
- IAM roles for cluster and node group
- All required IAM policy attachments
- Endpoint configuration:
  - Private access: enabled (for nodes in private subnets)
  - Public access: enabled (for kubectl access from outside VPC)

## Subnet Tags

Public subnets are tagged with:
- `kubernetes.io/cluster/test-eks-cluster = shared`
- `kubernetes.io/role/elb = 1` (for public load balancers)

Private subnets are tagged with:
- `kubernetes.io/cluster/test-eks-cluster = shared`
- `kubernetes.io/role/internal-elb = 1` (for internal load balancers)

## Usage

This example is used by the terratest in `terratest/aws/eks_test.go`.

To manually test:

```bash
terraform init
terraform plan
terraform apply
```

To destroy resources when done:

```bash
terraform destroy
```

## Notes

- Production-like setup with private subnets for security
- Node groups deployed in private subnets for enhanced security
- NAT Gateway provides outbound internet access for nodes
- Control plane accessible from both private and public endpoints
- All resources created directly (no VPC module dependency)
- Designed for automated testing with terratest
