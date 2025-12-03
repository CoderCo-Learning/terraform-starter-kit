# ECS Module

This module creates an AWS ECS (Elastic Container Service) cluster with Fargate launch type, including service, task definition, and required IAM roles.

## Features

- ECS Cluster creation
- ECS Service with Fargate launch type
- ECS Task Definition with container configuration
- IAM roles for task execution and task role
- CloudWatch Logs integration
- Load balancer support (optional)
- Comprehensive tagging via provider default_tags

## Usage

```hcl
module "ecs" {
  source = "./modules/aws/ecs"

  # Required variables
  cluster_name         = "your-cluster-name"
  task_desired_count   = 1  # Number of tasks to run
  assign_public_ip     = true
  security_groups      = ["sg-xxxxxxxxxxxxx"]
  subnets              = ["subnet-xxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyy"]
  container_image_url  = "your-account.dkr.ecr.region.amazonaws.com/your-image:tag"
  container_port       = 8080
  host_port            = 8080

  # Optional variables
  service_name         = "your-service-name"  # Defaults to "service"
  container_cpu_units  = 256                 # Defaults to 256
  container_memory     = 512                 # Defaults to 512
  task_family_name     = "your-task-family"  # Defaults to "task-family"

  environment_variables = {
    KEY = "value"
  }

  # Load balancer configuration (optional)
  enable_load_balancer = false
  # target_group_id = "arn:aws:elasticloadbalancing:region:account:targetgroup/name/id" # Required if enable_load_balancer is true

  # Task role (optional)
  # task_role_arn = "arn:aws:iam::account:role/your-task-role" # If not provided, a new role will be created
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.0 |
| aws | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 5.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| cluster_name | Name of the ECS cluster | `string` | n/a | yes |
| service_name | Name of the ECS service | `string` | `"service"` | no |
| task_desired_count | Desired count for ECS service tasks | `number` | n/a | yes |
| assign_public_ip | Assign public IP for the ECS service | `bool` | n/a | yes |
| security_groups | List of Security Group IDs for ECS | `list(string)` | n/a | yes |
| subnets | List of subnet IDs where the ECS service will run | `list(string)` | n/a | yes |
| container_image_url | Docker image for ECS container | `string` | n/a | yes |
| container_cpu_units | Total CPU units for ECS task definition | `number` | `256` | no |
| container_memory | Total memory (in MiB) for ECS task definition | `number` | `512` | no |
| container_port | Container port for ECS container | `number` | n/a | yes |
| host_port | Host port for ECS container | `number` | n/a | yes |
| enable_load_balancer | Enable load balancer configuration for ECS service | `bool` | `false` | no |
| target_group_id | Target Group ID for ECS (required if enable_load_balancer is true) | `string` | `null` | no |
| task_family_name | Task family for ECS task definition | `string` | `"task-family"` | no |
| environment_variables | Environment variables for the container (map of key-value pairs) | `map(string)` | `{}` | no |
| task_role_arn | ARN of an existing IAM role to use as the task role (optional - if not provided, a new role will be created) | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| ecs_cluster_id | ID of the ECS cluster |
| ecs_cluster_arn | ARN of the ECS cluster |
| ecs_cluster_name | Name of the ECS cluster |
| ecs_service_id | ID of the ECS service |
| ecs_service_name | Name of the ECS service |
| ecs_task_definition_id | ID of the ECS task definition |
| ecs_task_definition_arn | ARN of the ECS task definition |
| ecs_task_execution_role_arn | ARN of the ECS task execution role |
| ecs_task_role_arn | ARN of the ECS task role (if created) |

## Examples

See [examples/](./examples/) directory for complete examples.

## Notes

- All resources are automatically tagged with `ManagedBy` and `Module` tags via provider default_tags
- The module creates IAM roles for task execution and task role (unless an existing task_role_arn is provided)
- CloudWatch Logs are automatically configured for container logging
- The service uses Fargate launch type with awsvpc network mode
- Task definition revisions are ignored in lifecycle to prevent constant updates

## Resources Created

- `aws_ecs_cluster` - ECS cluster
- `aws_ecs_service` - ECS service
- `aws_ecs_task_definition` - Task definition
- `aws_iam_role` - Task execution role
- `aws_iam_role` - Task role (if not provided)
- `aws_iam_role_policy_attachment` - Execution policy attachment
- `aws_iam_role_policy` - Logs policy

