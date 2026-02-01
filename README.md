# CoderCo Terraform Starter Kits

**Production-Ready Terraform Modules for AWS**

---

## 📘 Overview

A curated collection of reusable, production-grade Terraform modules, real-world examples, and starter templates designed to accelerate AWS infrastructure builds while enforcing security, consistency, and best practices.

This repository follows **CoderCo Engineering Standards** and is intended for both learning and real-world usage.

---

## Getting Started

### How to Use These Modules

1. Select the module you need
2. Reference it in your Terraform configuration
3. Configure via variables
4. Test in dev or staging
5. Deploy with confidence 😌

---

## Available Modules & Examples

### AWS Modules

- **VPC** – Networking foundations (subnets, routing, gateways)
- **EC2** – Compute resources with security-first defaults
- **ECS** – Container orchestration for scalable workloads
- **S3** – Secure S3 buckets with optional versioning and encryption

Each module includes:
- Clear inputs and outputs
- Usage examples
- Opinionated but flexible defaults
- Documentation aligned with Terraform best practices

---

## ⚡ Quick Start

```bash
# Clone the repository
git clone https://github.com/CoderCo-Learning/terraform-starter-kit.git
cd terraform-starter-kit

# Navigate to an example
cd examples/aws/...

# Initialise and plan
terraform init
terraform plan
```

## Repository Structure

All modules follow a consistent structure to ensure readability, scalability, and maintainability:
```
modules/aws/<module-name>/
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

Contributions are welcome and encouraged.

### Before You Start

- Refer to [Contributing to Terraform Starter Kits](https://github.com/CoderCo-Learning/terraform-starter-kit/blob/dev/contribute/README.md)
- Follow branching, naming, and pull request rules
- Start with documentation, examples, or small improvements if you are new

### Standards

All contributions must align with:

- [Terraform Standards](https://github.com/CoderCo-Learning/terraform-starter-kit/blob/dev/contribute/terraform-standards.md) – Coding and design principles
- [Pull Requests](https://github.com/CoderCo-Learning/terraform-starter-kit/pulls) – Pull request expectations and checks

---

## 🛠️ Support & Feedback

- Found a bug?
- Have an improvement idea?

Open an **Issue** or submit a **Pull Request** — just don’t freestyle, we have standards for a reason 