resource "aws_ecs_service" "this" {
  name                               = var.service_name
  launch_type                        = var.launch_type
  platform_version                   = "LATEST"
  cluster                            = aws_ecs_cluster.this.id
  task_definition                    = aws_ecs_task_definition.this.id
  scheduling_strategy                = "REPLICA"
  desired_count                      = var.task_desired_count

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
      task_definition, # this is needed in order for the task revision to not constantly update on every Terraform Apply
      load_balancer, # this is needed so that CodeDeploy does not fail the Terraform Apply. The situation where this may happen will be after you have ran Deployment Strategy and then want to run Terraform Apply again on your code again
      desired_count # this is optional. ECS will no longer enforce the desired count if Terraform was to be applied a second (or third or foruth. etc) time
    ]
  }
}