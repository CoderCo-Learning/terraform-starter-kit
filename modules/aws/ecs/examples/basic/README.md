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

- AWS Provider >= 6.24.0
- Terraform >= 1.12.2
- Valid AWS credentials configured
- Existing VPC with subnets and security groups

## Inputs

See the main module README for all available variables.

## Outputs

After applying, you can access:

- `ecs_cluster_id` - The ECS cluster ID
- `ecs_cluster_arn` - The ECS cluster ARN
- `ecs_service_arn` - The ECS service ARN
- `ecs_task_definition_arn` - The task definition ARN
- `ecs_task_execution_role_arn` - The ECS task execution role ARN
- `ecs_task_role_arn` - The ECS task role ARN

