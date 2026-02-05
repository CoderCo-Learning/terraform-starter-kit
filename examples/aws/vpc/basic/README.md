# Basic VPC Example - V1.0.0

This example demonstrates a basic Virtual Private Cloud (VPC) deployment using the VPC module.

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## What This Creates

- A VPC with DNS support enabled
- Public subnets across multiple availability zones
- An Internet Gateway with a public route table
- Optional private subnets with a private route table
- Optional NAT Gateway for outbound internet access from private subnets
- Optional VPC Flow Logs delivered to CloudWatch Logs
- Resource tags applied to all supported resources

## Requirements

- AWS Provider >= 6.24.0
- Terraform >= 1.11.0
- Valid AWS credentials configured
- An AWS account with permissions to create VPC and networking resources

## Inputs

See the main module README for all available variables.

## Outputs

After applying, you can access:

- `vpc_id` – The ID of the created VPC
- `public_subnet_ids` – IDs of the public subnets
- `private_subnet_ids` – IDs of the private subnets (if created)