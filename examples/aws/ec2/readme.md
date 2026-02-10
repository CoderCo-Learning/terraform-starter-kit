# Basic EC2 Example

This example demonstrates a basic EC2 instance deployment using the EC2 module.

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## What This Creates

- EC2 instance
- Associated network interface
- Root EBS volume
- EC2 instance tags (via provider default tags and module tags)

## Requirements

- AWS Provider >~> 6.15.0
- Terraform >= 1.2.0
- Valid AWS credentials configured
- Existing VPC with subnets and security groups

## Inputs

See the main module README for all available variables.

## Outputs

After applying, you can access:

- `instance_id` - The ID of the EC2 instance
- `public_ip` - Public IP address of the EC2 instance
- `private_ip` - Private IP address of the EC2 instance

