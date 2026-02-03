# CoderCo Terraform Starter Kits
![CoderCo Standards](https://img.shields.io/badge/CoderCo-Engineering%20Standards-purple)
![Terraform](https://img.shields.io/badge/Terraform-supported-623CE4?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen)

**Production-Ready Terraform Modules for AWS**

---

## Overview

A curated collection of reusable, production-grade Terraform modules, real-world examples, and starter templates designed to accelerate AWS infrastructure builds while enforcing security, consistency, and best practices.

This repository follows **CoderCo Engineering Standards** and is intended for both learning and real-world usage.

---

## Getting Started

### How to Use These Modules

1. Select the module you need
2. Reference it in your Terraform configuration
3. Configure via variables
4. Test in dev or staging
5. Deploy with confidence 

---

## Available Modules & Examples

### AWS Modules

- **[VPC](modules/aws/vpc)** – Networking foundations (subnets, routing, gateways)
- **[EC2](modules/aws/ec2)** – Compute resources with security-first defaults
- **[ECS](modules/aws/ecs)** – Container orchestration for scalable workloads

Each module includes:
- Clear inputs and outputs
- Usage examples
- Opinionated but flexible defaults
- Documentation aligned with Terraform best practices

---

## Quick Start

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

This repository is currently maintained by

<svg height="16" width="16" viewBox="0 0 16 16" aria-hidden="true">
  <path fill="currentColor" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38
  0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52
  -.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2
  -3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21
  2.2.82.64-.18 1.32-.27 2-.27s1.36.09 2 .27c1.53-1.04 2.2-.82
  2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82
  2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54
  1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013
  8.013 0 0 0 16 8c0-4.42-3.58-8-8-8Z"/>
</svg>
[JunedConnect](https://github.com/JunedConnect)
<svg height="16" width="16" viewBox="0 0 16 16"><path fill="currentColor" d="M8 0C3.58 0 0 3.58 0 8..."/></svg>
[munaai](https://github.com/munaai)
<svg height="16" width="16" viewBox="0 0 16 16"><path fill="currentColor" d="M8 0C3.58 0 0 3.58 0 8..."/></svg>
[zyusuf88](https://github.com/zyusuf88)

This repository is currently maintained by  
<img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" width="16" /> [JunedConnect](https://github.com/JunedConnect)
<img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" width="16" /> [munaai](https://github.com/munaai)
<img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" width="16" /> [zyusuf88](https://github.com/zyusuf88)

### Before You Start

- Refer to [Contributing to Terraform Starter Kits](https://github.com/CoderCo-Learning/terraform-starter-kit/blob/dev/contribute/README.md)
- Follow branching, naming, and pull request rules
- Start with documentation, examples, or small improvements if you are new

### Standards

All contributions must align with:

- [Terraform Standards](contribute/terraform-standards.md) – Coding and design principles
- [Pull Requests](https://github.com/CoderCo-Learning/terraform-starter-kit/pulls) – Pull request expectations and checks

---

## Support & Feedback

- Found a bug?
- Have an improvement idea?

Open an **Issue** or submit a **Pull Request** — just don’t freestyle, we have standards for a reason 