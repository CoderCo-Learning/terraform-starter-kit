# EC2 Module

This module provisions a single AWS EC2 instance with configurable networking, instance type, and optional SSH access.

## Features

- EC2 instance creation
- Support for custom AMI and instance type
- VPC subnet and security group attachment
- Optional EC2 key pair support
- Automatic tagging via provider default_tags

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.2.0 |
| aws | ~> 6.15.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|------------|------|---------|----------|
| instance_name | Name tag for the EC2 instance | `string` | n/a | yes |
| ami_id | AMI ID to use for the EC2 instance | `string` | n/a | yes |
| instance_type | EC2 instance type | `string` | n/a | yes |
| subnet_id | Subnet ID where the EC2 instance will be launched | `string` | n/a | yes |
| security_group_ids | List of security group IDs attached to the instance | `list(string)` | n/a | yes |
| key_name | Optional EC2 key pair name for SSH access | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | The ID of the EC2 instance |
| public_ip | Public IP address of the EC2 instance |
| private_ip | Private IP address of the EC2 instance |

## Examples

See the [examples/](../../../examples/basic/) directory for complete usage examples.

## Notes

- **Networking resources are required** — this module does not create VPCs, subnets, or security groups
- SSH access is optional and only enabled when `key_name` is provided
- All resources are automatically tagged using provider `default_tags`
- This module is intentionally minimal and designed to be composed with other infrastructure modules

## Resources Created

- `aws_instance` – EC2 instance
