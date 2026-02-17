terraform {
  required_version = ">= 1.12.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.24.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

module "ecs" {
  source = "../../../../modules/aws/ecs"

  # Required variables
  cluster_name        = "my-ecs-cluster"
  task_desired_count  = 2
  assign_public_ip    = true
  security_groups     = [aws_security_group.this.id]
  subnets             = aws_subnet.public[*].id
  container_image_url = "677276074604.dkr.ecr.eu-west-2.amazonaws.com/weather-app"
  container_port      = 8080
  host_port           = 8080

  # Optional variables
  service_name        = "my-ecs-service" # Defaults to "service"
  container_cpu_units = 256              # Optional, defaults to 256
  container_memory    = 512              # Optional, defaults to 512
  task_family_name    = "my-task-family" # Defaults to "task-family"

  environment_variables = {
    ENV       = "production"
    LOG_LEVEL = "info"
  }

  # Load balancer configuration (optional)
  enable_load_balancer = true                         # Defaults to false
  target_group_id      = aws_lb_target_group.this.arn # Required if enable_load_balancer is true

  # Task role (optional)
  task_role_arn        = aws_iam_role.test_task_role.arn
  use_custom_task_role = true # Set to true to use your own task role
}
