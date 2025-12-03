resource "aws_ecs_service" "main" {
  name                = var.service_name
  launch_type         = "FARGATE"
  platform_version    = "1.4.0"
  cluster             = aws_ecs_cluster.main.id
  task_definition     = aws_ecs_task_definition.main.id
  scheduling_strategy = "REPLICA"
  desired_count       = var.task_desired_count

  network_configuration {
    assign_public_ip = var.assign_public_ip
    security_groups  = var.security_groups
    subnets          = var.subnets
  }

  dynamic "load_balancer" {
    for_each = var.enable_load_balancer ? [1] : []
    content {
      container_name   = "container"
      container_port   = var.container_port
      target_group_arn = var.target_group_id
    }
  }

  lifecycle {
    ignore_changes = [
      task_definition, # Needed to prevent task revision from constantly updating on every Terraform Apply
      desired_count    # Optional: ECS will no longer enforce the desired count if Terraform is applied multiple times
    ]
  }
}