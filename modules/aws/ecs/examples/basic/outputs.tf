output "cluster_id" {
  description = "ECS Cluster ID"
  value       = module.ecs.ecs_cluster_id
}

output "service_id" {
  description = "ECS Service ID"
  value       = module.ecs.ecs_service_id
}

output "task_definition_arn" {
  description = "ECS Task Definition ARN"
  value       = module.ecs.ecs_task_definition_arn
}

