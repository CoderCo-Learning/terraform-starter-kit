output "ecs_cluster_id" {
    description = "ID of the ECS cluster"
    value = aws_ecs_cluster.this.id
}

output "ecs_service_id" {
    description = "ID of the ECS service"
    value = aws_ecs_service.this.id
}

output "ecs_task_definition_id" {
    description = "ID of the ECS task definition"
    value = aws_ecs_task_definition.this.id
}