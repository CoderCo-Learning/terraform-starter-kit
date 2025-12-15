output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

#VPC Flow Logs Output

output "flow_log_id" {
  description = "ID of the VPC Flow Log (if enabled)"
  value       = var.enable_flow_logs ? aws_flow_log.this[0].id : null
}

output "flow_log_log_group_name" {
  description = "CloudWatch Log Group name for VPC Flow Logs"
  value       = var.enable_flow_logs ? aws_cloudwatch_log_group.flow_logs[0].name : null
}