# Basic EKS Example - V1.0.0

This example demonstrates a basic EKS cluster setup with managed node groups.

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## What This Creates

- EKS Cluster
- Managed Node Group with scaling configuration
- IAM roles for EKS cluster and node group
- Security groups (created automatically by EKS)

## Requirements

- AWS Provider >= 6.24.0
- Terraform >= 1.12.2
- Valid AWS credentials configured
- Existing VPC with subnets **(must be created separately)**
- Subnets must be properly tagged for EKS (see module documentation)

## Inputs

See the main module README for all available variables.

## Outputs

After applying, you can access:

- `cluster_name` - The EKS cluster name
- `cluster_endpoint` - The EKS cluster API endpoint
- `cluster_ca_certificate` - The cluster certificate authority data
- `oidc_issuer_url` - The OIDC issuer URL for IAM roles for service accounts
