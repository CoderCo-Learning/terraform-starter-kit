# VPC Module

This module creates a production-ready Virtual Private Cloud (VPC) on AWS, including public and private subnets, route tables, an Internet Gateway, and an optional NAT Gateway for outbound access from private subnets.

The module follows AWS best practices and is suitable for ECS, EKS, EC2, and wider cloud infrastructure architectures.

---

## 🚀 Features

- VPC creation with configurable CIDR block  
- Public subnets (one per AZ)  
- Private subnets (one per AZ)  
- Internet Gateway  
- Optional NAT Gateway for private subnet outbound traffic  
- Public and private route tables  
- Route table associations  
- Supports tagging via provider `default_tags`  
- Validated with AWS provider v6+  

---

##  Requirements

| Name       | Version      |
|------------|--------------|
| terraform  | >= 1.5.0     |
| aws        | >= 5.0.0     |

---

##  Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `vpc_cidr_block` | CIDR block for the VPC | string | n/a | yes |
| `azs` | List of availability zones | list(string) | n/a | yes |
| `public_subnet_cidrs` | CIDRs for public subnets | list(string) | n/a | yes |
| `private_subnet_cidrs` | CIDRs for private subnets | list(string) | n/a | yes |
| `enable_nat_gateway` | Whether to create a NAT Gateway | bool | true | no |

---

##  Outputs

| Name | Description |
|------|-------------|
| `vpc_id` | ID of the VPC |
| `public_subnet_ids` | IDs of public subnets |
| `private_subnet_ids` | IDs of private subnets |

---

##  Example Usage

See full examples in the `examples/` directory.

Basic example:

```hcl
module "vpc" {
  source = "../../modules/aws/vpc"

  vpc_cidr_block       = "10.0.0.0/16"
  azs                  = ["eu-west-2a", "eu-west-2b"]
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
}