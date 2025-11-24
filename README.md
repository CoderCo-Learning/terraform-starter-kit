# CoderCo Terraform Starter Kits

> **Production-ready Terraform modules and examples for the CoderCo community**

This repository contains reusable Terraform modules, real-world examples, and starter templates following [CoderCo Engineering Standards](https://github.com/CoderCo-Learning/engineering-standards).

## What's Here

- **Modules** - Reusable, tested Terraform modules
- **Examples** - Complete working examples you can copy
- **Templates** - Starter templates for common patterns
- **Best Practices** - Best practices for Terraform code

## Quick Start

```bash
# Clone the repo
git clone https://github.com/CoderCo-Learning/terraform-starter-kit.git
cd terraform-starter-kit

# Navigate to an example
cd examples/aws-vpc-basic

# Initialize and apply
terraform init
terraform plan
terraform apply
```

## Available Modules

### AWS Modules
- [**vpc**](./modules/aws/vpc) - VPC with public/private subnets
- [**ec2-instance**](./modules/aws/ec2-instance) - EC2 instance with best practices
- [**s3-bucket**](./modules/aws/s3-bucket) - S3 bucket with security defaults

More modules coming soon!

## Examples

### Basic Examples
- [**aws-vpc-basic**](./examples/aws-vpc-basic) - Simple VPC setup
- [**ec2-web-server**](./examples/ec2-web-server) - Web server deployment
- [**s3-static-site**](./examples/s3-static-site) - Static website hosting

### Advanced Examples

Coming soon as the team builds them!

## Module Structure

All modules follow this structure:
```
modules/aws/vpc/
├── README.md           # Module documentation
├── main.tf             # Resource definitions
├── variables.tf        # Input variables
├── outputs.tf          # Output values
├── versions.tf         # Provider versions
└── examples/
    └── basic/
        ├── main.tf
        └── README.md
```

## Contributing

This is a **MOT team project**! 

### Your First Contribution

1. Check the [issues](../../issues) for `good-first-issue` label
2. Read our [Terraform Standards](https://github.com/YourUsername/coderco-engineering-standards/blob/main/docs/terraform-standards.md)
3. Submit a small PR (docs, example, or simple module improvement)

### What We Need

- New modules for common patterns
- More examples and use cases
- Better documentation
- Tests for existing modules
- Bug fixes and improvements

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## Standards

All code in this repo follows:
- [CoderCo Terraform Standards](https://github.com/CoderCo-Learning/engineering-standards/blob/main/terraform-standards.md)
- [CoderCo Kubernetes Standards](https://github.com/CoderCo-Learning/engineering-standards/blob/main/k8s-standards.md)

## Using These Modules

### In Your Own Projects
```hcl
module "vpc" {
  source = "github.com/CoderCo/terraform-starter-kits//modules/aws/vpc?ref=v1.0.0"
  
  vpc_cidr    = "10.0.0.0/16"
  environment = "prod"
  project     = "my-app"
}
```

### Local Development

```hcl
module "vpc" {
  source = "../../modules/aws/vpc"
  
  vpc_cidr    = "10.0.0.0/16"
  environment = "dev"
  project     = "my-app"
}
```

## Important Notes

- Always pin module versions in production
- Review module code before using
- Test in dev/staging first
- Follow security best practices
- Never commit secrets or credentials

## Learning Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [CoderCo Terraform Standards](https://github.com/CoderCo-Learning/engineering-standards/blob/main/terraform-standards.md)

## 💬 Support

- **Issues**: [GitHub Issues](../../issues)
- **Discussions**: [GitHub Discussions](../../discussions)
- **MOT Team**: Ask in your pod or main chat

---

Built with ❤️ by the CoderCo community