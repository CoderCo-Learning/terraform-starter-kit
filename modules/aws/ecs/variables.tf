variable "enable_load_balancer" {
  description = "Enable load balancer configuration for ECS service"
  type        = bool
  default     = false
}

variable "security_groups" {
  description = "List of Security Group IDs for ECS"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnet IDs where the ECS service will run"
  type        = list(string)
}

variable "target_group_id" {
  description = "Target Group ID for ECS (required if enable_load_balancer is true)"
  type        = string
  default     = null
  
  validation {
    condition     = var.enable_load_balancer ? var.target_group_id != null : true
    error_message = "target_group_id is required when enable_load_balancer is true."
  }
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "cluster"
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
  default     = "service"
}

variable "task_desired_count" {
  description = "Desired count for ECS service tasks"
  type        = number
}

variable "assign_public_ip" {
  description = "Assign public IP for the ECS service"
  type        = bool
}

variable "task_family_name" {
  description = "Task family for ECS task definition"
  type        = string
  default     = "task-family"
}

variable "container_image_url" {
  description = "Docker image for ECS container"
  type        = string
}

variable "container_cpu_units" {
  description = "Total CPU units for ECS task definition"
  type        = number
}

variable "container_memory" {
  description = "Total memory (in MiB) for ECS task definition"
  type        = number
}

variable "container_port" {
  description = "Container port for ECS container"
  type        = number
}

variable "host_port" {
  description = "Host port for ECS container"
  type        = number
}

variable "environment_variables" {
  description = "Environment variables for the container (map of key-value pairs)"
  type        = map(string)
  default     = {}
}

variable "task_role_arn" {
  description = "ARN of an existing IAM role to use as the task role (optional - if not provided, a new role will be created)"
  type        = string
  default     = null
}
