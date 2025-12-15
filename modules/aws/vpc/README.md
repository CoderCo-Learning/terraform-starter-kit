# VPC Module - V1.0.0

This module creates a production-ready Virtual Private Cloud (VPC) on AWS, including public and private subnets, route tables, an Internet Gateway, and an optional NAT Gateway for outbound access from private subnets.

The module follows AWS best practices and is suitable for ECS, EKS, EC2, and wider cloud infrastructure architectures.

---

##  Features

- VPC creation with configurable CIDR block  
- Public subnets (one per AZ)  
- Private subnets (one per AZ)  
- Internet Gateway  
- Optional NAT Gateway for private subnet outbound traffic
- Optional VPC Flow Logs to CloudWatch Logs   
- Public and private route tables  
- Route table associations  
- Centralised tagging via module inputs  
- Validated with AWS provider v6+  

##  Requirements

| Name       | Version      |
|------------|--------------|
| terraform  | >= 1.5.0     |
| aws        | >= 5.0.0     |


##  Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `name` | Base name used for all VPC resources | string | n/a | yes |
| `vpc_cidr_block` | CIDR block for the VPC | string | n/a | yes |
| `azs` | List of availability zones | list(string) | n/a | yes |
| `public_subnet_cidrs` | CIDRs for public subnets | list(string) | n/a | yes |
| `private_subnet_cidrs` | CIDRs for private subnets | list(string) | n/a | yes |
| `enable_nat_gateway` | Enable NAT Gateway for private subnets | bool | false | no |
| `enable_flow_logs` | Enable VPC Flow Logs | bool | false | no |
| `flow_log_traffic_type` | Flow log traffic type (ALL, ACCEPT, REJECT) | string | `"ALL"` | no |
| `flow_log_retention_days` | Flow log retention in days | number | `14` | no |
| `tags` | Additional tags applied to all resources | map(string) | `{}` | no |

## NAT Gateway (Optional)

The NAT Gateway provides outbound internet access for resources in private subnets.

- Disabled by default to avoid unexpected costs
- When enabled, a single NAT Gateway is created in the first public subnet
- When disabled, private subnets will not have outbound internet access

Enable with:

```hcl
enable_nat_gateway = true
```

## VPC Flow Logs (Optional)

VPC Flow Logs capture network traffic metadata for the VPC and can be used for
troubleshooting, security visibility, and auditing.

- Disabled by default to avoid unnecessary logging costs
- Logs are sent to CloudWatch Logs
- Retention is configurable

Enable with:

```hcl
enable_flow_logs = true
```

##  Outputs

| Name | Description |
|------|-------------|
| `vpc_id` | ID of the VPC |
| `public_subnet_ids` | IDs of public subnets |
| `private_subnet_ids` | IDs of private subnets |


##  Example Usage

See full examples in the `examples/` directory.

## Notes

- Subnets are created per Availability Zone in the order provided via the `azs` variable
- Public subnets are configured with `map_public_ip_on_launch = true`
- Private subnets do not have outbound internet access unless the NAT Gateway is enabled
- When enabled, a single NAT Gateway is created in the first public subnet to minimise cost
- NAT Gateway is disabled by default to avoid unexpected AWS charges
- VPC Flow Logs are disabled by default to avoid unnecessary logging costs
- VPC Flow Logs capture metadata only and do not inspect packet payloads
- Flow Logs are delivered to CloudWatch Logs with a configurable retention period
- All resources are tagged using the provided `name` and `tags` inputs

## Resources Created

- aws_vpc – VPC
- aws_subnet – Public and private subnets
- aws_internet_gateway – Internet Gateway
- aws_route_table – Public and private route tables
- aws_route – Internet and NAT routes
- aws_nat_gateway – NAT Gateway (optional)
- aws_flow_log – VPC Flow Logs (optional)
- aws_cloudwatch_log_group – Flow Logs log group (optional)
- aws_iam_role – Flow Logs IAM role (optional)