# 'Terraform Module' README Templates

<br>

## Module README Template

```markdown
# Module Name - V1.0.0

Brief description of what this module does.

## Features

- List key features of the module
- Another important feature
- Another capability

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5 |
| aws | >= 5.0 |

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

## Notes

- Resources are tagged with `ManagedBy = "Terraform"` automatically via provider default tags
- All resource names are prefixed with the `name` variable for easy identification

## Resources Created

This module creates the following resources:

- `aws_vpc`
- `aws_subnet`
- `aws_internet_gateway`

## Previous Versions

For previous versions of this module, see [previous-versions/](../previous-versions/) directory.
```

---

<br>

## 'Module Example' README Template

```markdown
# Example Name - V1.0.0

Brief description of what this example demonstrates.

## Usage

terraform init
terraform plan
terraform apply

## What This Creates

- List of AWS resources that will be created
- Another resource  
- Another resource

## Requirements

- AWS Provider >= 6.24.0
- Terraform >= 1.5
- Valid AWS credentials configured
- Any other prerequisites (VPC, subnets, security groups, etc.)

## Inputs

See the main module README for all available variables.

## Outputs

After applying, you can access:

- `output_name` - Description of output
```