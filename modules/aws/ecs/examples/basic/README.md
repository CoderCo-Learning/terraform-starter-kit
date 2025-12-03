# Basic ECS Example

This example demonstrates a basic ECS setup with Fargate.

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## What This Creates

- ECS Cluster
- ECS Service with Fargate launch type
- ECS Task Definition
- IAM roles for task execution and task role
- CloudWatch Log Group (created automatically by ECS)

## Requirements

- AWS Provider >= 5.95.0
- Terraform >= 1.12.2
- Valid AWS credentials configured
- Existing VPC with subnets and security groups

## Inputs

See the main module README for all available variables.

## Outputs

After applying, you can access:

- `ecs_cluster_id` - The ECS cluster ID
- `ecs_service_id` - The ECS service ID
- `ecs_task_definition_arn` - The task definition ARN

