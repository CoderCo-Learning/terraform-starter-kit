# Module Template

Use this as a starting point for creating new modules.

## Structure

```
modules/<provider>/<resource>/
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf
└── examples/
    └── basic/
        ├── main.tf
        ├── outputs.tf
        ├── variables.tf
        └── README.md
```

## README.md Template

````markdown
# [Module Name]

Brief description of what this module creates.

## Features

- Feature 1
- Feature 2
- Feature 3

## Usage

### Basic Example

```hcl
module "example" {
  source = "../../modules/provider/resource"
  
  name        = "myapp"
  environment = "prod"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.0 |
| aws | >= 5.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | Resource name | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | Resource ID |

## Examples

See [examples/](./examples/) directory.
````

## main.tf Template

```hcl
# Data sources (if needed)
data "aws_availability_zones" "available" {
  state = "available"
}

# Main resource
resource "aws_example_resource" "main" {
  name = "${var.project}-${var.environment}"
  
  # Resource-specific configuration
  
  tags = merge(
    var.tags,
    {
      Name        = "${var.project}-${var.environment}"
      Environment = var.environment
      Project     = var.project
      ManagedBy   = "Terraform"
    }
  )
}
```

## variables.tf Template

```hcl
variable "project" {
  description = "Project name"
  type        = string
  
  validation {
    condition     = length(var.project) > 0
    error_message = "Project name cannot be empty."
  }
}

variable "environment" {
  description = "Environment name"
  type        = string
  
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
```

## outputs.tf Template

```hcl
output "id" {
  description = "Resource ID"
  value       = aws_example_resource.main.id
}

output "arn" {
  description = "Resource ARN"
  value       = aws_example_resource.main.arn
}
```

## versions.tf Template

```hcl
terraform {
  required_version = ">= 1.5.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}
```

## Example main.tf Template

```hcl
terraform {
  required_version = ">= 1.5.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "example" {
  source = "../../modules/aws/resource"
  
  project     = "demo"
  environment = "dev"
}
```

## Checklist

When creating a new module:

- [ ] Created proper directory structure
- [ ] Added README with usage examples
- [ ] Implemented resource in main.tf
- [ ] Added variables with validation
- [ ] Added meaningful outputs
- [ ] Set version constraints
- [ ] Created at least one working example
- [ ] Tagged all resources
- [ ] Ran `terraform fmt -recursive`
- [ ] Ran `terraform validate`
- [ ] Tested the example

## Tips

1. **Start simple** - Basic working module first, enhance later
2. **Use data sources** - Don't hardcode AZs, regions, etc.
3. **Validate inputs** - Add validation rules to prevent errors
4. **Tag everything** - Consistent tagging helps with cost tracking
5. **Document well** - Good docs = more usage
6. **Test thoroughly** - Run examples before submitting

## Need Help?

- Check existing modules for patterns
- Ask in your pod
- Review [Terraform Standards](https://github.com/CoderCo-Learning/engineering-standards/blob/main/terraform-standards.md)
- Open an issue for discussion