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
  source = "git::https://github.com/CoderCo-Learning/terraform-starter-kit//modules/aws/ecs"

  # Required variables
  cluster_name        = "my-ecs-cluster"
  task_desired_count  = 1
  assign_public_ip    = true
  security_groups     = ["sg-1234567890abcdef0"] # Replace with your security group ID
  subnets             = ["subnet-1234567890abcdef0", "subnet-0987654321fedcba0"] # Replace with your subnet IDs
  container_image_url = "123456789012.dkr.ecr.eu-west-2.amazonaws.com/my-app:latest" # Replace with your container image URL
  container_port      = 1234
  host_port           = 1234

  # Optional variables
  service_name        = "my-ecs-service" # Defaults to "service"
  container_cpu_units = 256              # Optional, defaults to 256
  container_memory    = 512              # Optional, defaults to 512
  task_family_name    = "my-app-task"    # Defaults to "task-family"

  environment_variables = {
    ENV  = "development" # Replace with your environment variables (if needed)
  }

  # Load balancer configuration (optional)
  # enable_load_balancer = false  # Defaults to false
  # target_group_id = "arn:aws:elasticloadbalancing:..." # Required if enable_load_balancer is true

  # Task role (optional)
  # task_role_arn = "arn:aws:iam::123456789012:role/my-task-role" # If not provided, a new role will be created

}

