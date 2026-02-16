# ECS Terratest Example

This example creates a complete ECS environment for automated testing with Terratest.

## Purpose

This example is specifically designed for automated testing and creates all required infrastructure from scratch without using external modules except the ECS module being tested.

## File Structure

- **main.tf** - Terraform/provider configuration and ECS module declaration
- **non-module.tf** - All non-module resources (data blocks, load balancer, security group, IAM role, target group)
- **outputs.tf** - Output values for terratest validation

## What Gets Created

**Network Resources:**
- 1 VPC (`10.0.0.0/16`)
- 2 Public subnets (`10.0.1.0/24`, `10.0.2.0/24`) across 2 AZs
- Internet Gateway
- Public route table with routes
- Security group with ingress rules for ports 80, 443, and 8080
- All egress traffic allowed

**Load Balancer Resources:**
- Application Load Balancer (public-facing)
- Target Group (configured for port 8080, IP target type)
- ALB Listener (port 80, forwards to target group)

**ECS Resources:**
- ECS cluster
- ECS service with 2 tasks
- Task definition (256 CPU, 512 memory)
- Container using weather-app image from ECR
- IAM roles for cluster and tasks
- All required IAM policy attachments
- Load balancer integration enabled
- Container port mapping: 8080

## Usage

This example is used by the terratest in `terratest/aws/ecs_lb_test.go`.

To manually test:

```bash
terraform init
terraform plan
terraform apply
```

To test the deployed application:

```bash
# Get the load balancer DNS from outputs
terraform output lb_dns

# Visit in browser or curl
curl http://<lb_dns>
```

To destroy resources when done:

```bash
terraform destroy
```

## Notes

- Creates its own VPC and networking infrastructure
- Public-facing load balancer for easy testing
- Container image points to a pre-existing ECR image
- Tasks deployed with public IP assignment
- All resources created directly (no VPC/networking module dependency)
- Designed for automated testing with terratest
- ECS tasks are configured with a custom task role for testing optional role functionality
