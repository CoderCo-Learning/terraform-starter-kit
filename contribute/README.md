# Contributing to Terraform Starter Kits

Thank you for your interest in contributing to the CoderCo Terraform Starter Kits! This repository is a community project, and we welcome contributions from all skill levels.

## Table of Contents
- [Getting Started](#getting-started)
- [Ways to Contribute](#ways-to-contribute)
- [Development Setup](#development-setup)
- [Creating a Module](#creating-a-module)
- [Adding an Example](#adding-an-example)
- [Testing](#testing)
- [Code Standards](#code-standards)
- [Submitting Changes](#submitting-changes)
- [Code of Conduct](#code-of-conduct)

## Getting Started

1. Fork the repository on GitHub
2. Clone your fork and create a feature branch:
   ```bash
   Example:
   git clone https://github.com/YOUR-USERNAME/terraform-starter-kit.git
   git checkout -b feature/your-feature-name
   ```
3. Make your changes and commit them
4. Push to your fork and submit a Pull Request to the `dev` branch

## Ways to Contribute

- **Documentation** - Improve guides and docs
- **New Modules** - Create reusable infrastructure components
- **New Examples** - Share practical use cases
- **Testing** - Add Terratest coverage
- **Bug Fixes** - Report and fix issues
- **Improvements** - Enhance existing features

## Development Setup

### Prerequisites
- **Terraform** >= 1.0
- **Go** >= 1.19 (for testing with Terratest)
- **AWS CLI** configured with credentials
- **Git**

### Local Setup
```bash
# Clone your fork
git clone https://github.com/YOUR-USERNAME/terraform-starter-kit.git
cd terraform-starter-kit

# Install pre-commit hooks (optional)
pre-commit install

# Verify Terraform formatting
terraform fmt -recursive .
```

## Creating a Module

### Directory Structure
Create your module following this pattern:
```
modules/aws/your-module/
├── README.md              # Module documentation
├── main.tf                # Resource definitions
├── variables.tf           # Input variables
├── outputs.tf             # Output values
├── provider.tf            # Provider configuration
└── versions.tf            # Provider version constraints

examples/aws/your-module/
├── main.tf
├── outputs.tf
└── README.md
```

### Managing Module Versions
Keep previous versions of modules for backward compatibility:
```
modules/aws/
├── your-module/           # Current version
│   ├── README.md
│   ├── main.tf
│   └── ...
└── previous-versions/
    └── your-module/
        └── v1.0/
            ├── README.md
            ├── main.tf
            └── ...

examples/aws/
├── your-module/           # Current version example
│   ├── main.tf
│   └── outputs.tf
└── previous-versions/
    └── your-module/
        └── v1.0/
            ├── main.tf
            ├── outputs.tf
            └── README.md
```

### README.md

For detailed template, see [terraform-module-readme-template.md](./terraform-module-readme-template.md)


### Adding an Example

- Fully functional and tested
- Include README at the example level documenting the use case (see [terraform-module-readme-template.md](./terraform-module-readme-template.md))
- Provides realistic use case
- Includes cleanup instructions

## Testing

### Running Tests

```bash
# Run all tests
cd terratest
go test -v ./...

# Run specific test
go test -v ./aws/vpc_test.go

# With timeout
go test -v -timeout 30m ./...
```

### Writing Tests

Create tests in `terratest/` following the Terratest framework.

Example:
```go
package test

func TestVPC(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../../examples/aws-vpc-basic",
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
```

### Test Requirements
- Tests must be idempotent
- Clean up resources (use `defer terraform.Destroy()`)
- Document what's being tested
- Use meaningful assertions

## Code Standards

For Terraform code standards, naming conventions, best practices, and formatting guidelines, please refer to [terraform-standards.md](./terraform-standards.md).

## Submitting Changes

For a complete pre-submission checklist and PR guidelines, please refer to [pull-request-guidelines.md](./pull-request-guidelines.md).

## Getting Help

- **Issues**: Search existing or create a new one
- **Discussions**: Use GitHub discussions for questions
- **Pull Request Reviews**: Ask maintainers if stuck

## Code of Conduct

- Be respectful and inclusive
- Welcome different experience levels
- Provide constructive feedback
- Celebrate contributions from all

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.
