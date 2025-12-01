data "aws_region" "current" {}

resource "aws_ecs_task_definition" "this" {
  family                   = var.task_family_name
  requires_compatibilities = ["FARGATE"]
  task_role_arn      = var.task_role_arn != null ? var.task_role_arn : aws_iam_role.ecs_task_role[0].arn
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  cpu                      = var.container_cpu_units
  memory                   = var.container_memory
  container_definitions = jsonencode([
    {
      name      = "container"
      image     = var.container_image_url
    #   cpu       = var.container_cpu_units
    #   memory    = var.container_memory
      essential = true
      
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.host_port
        }
      ]

      environment = [
        for key, value in var.environment_variables : {
          name  = key
          value = value
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/${var.task_family_name}"
          awslogs-region        = data.aws_region.current.name
          awslogs-stream-prefix = "ecs"
          awslogs-create-group  = "true"
        }
      }
    }
  ])
}