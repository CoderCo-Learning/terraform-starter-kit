# ECS Module - V1.0.0

This module creates an AWS ECS (Elastic Container Service) cluster with Fargate launch type, including service, task definition, and required IAM roles.

## Features

- ECS Cluster creation
- ECS Service with Fargate launch type
- ECS Task Definition with container configuration
- IAM roles for task execution and task role
- CloudWatch Logs integration
- Load balancer support (optional)
- Comprehensive tagging via provider default_tags

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.12.2 |
| aws | >= 6.24.0 |

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
| task_role_arn | ARN of an existing IAM role to use as the task role (required if use_custom_task_role is true) | `string` | `null` | no |
| use_custom_task_role | Set to true to use your own task role (via task_role_arn). When false, a new task role will be created | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| ecs_cluster_id | ID of the ECS cluster |
| ecs_cluster_arn | ARN of the ECS cluster |
| ecs_service_arn | ARN of the ECS service |
| ecs_task_definition_arn | ARN of the ECS task definition |
| ecs_task_execution_role_arn | ARN of the ECS task execution role |
| ecs_task_role_arn | ARN of the ECS task role |

## Examples

See [examples/](examples/) directory for complete examples.

## Notes

- **Fargate launch type only** - This module currently only supports the FARGATE launch type. EC2 launch type is not supported as of now.
- **Security groups are required** - You must create and provide at least one security group ID for the ECS service. The module does not create security groups. Ensure your security groups allow the necessary inbound/outbound traffic for your service.
- **Load balancer not included** – If you wish to use the load balancer feature, you must create the load balancer and target group yourself, and provide the target group to the module input.
- All resources are automatically tagged with `ManagedBy` and `Module` tags via provider default_tags
- The module creates IAM roles for task execution and task role. (task role will not be created if `use_custom_task_role` is set to `true` and `task_role_arn` is provided)
- CloudWatch Logs are automatically configured for container logging
- The service uses Fargate launch type with awsvpc network mode
- Task definition revisions are ignored in lifecycle to prevent constant updates

## Resources Created

- `aws_ecs_cluster` - ECS cluster
- `aws_ecs_service` - ECS service
- `aws_ecs_task_definition` - Task definition
- `aws_iam_role` - Task execution role
- `aws_iam_role` - Task role (if `use_custom_task_role` is `false`)
- `aws_iam_role_policy_attachment` - Execution policy attachment
- `aws_iam_role_policy` - Logs policy