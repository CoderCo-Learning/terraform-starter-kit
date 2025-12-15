variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones to use for subnets"

  validation {
    condition     = length(var.azs) > 0
    error_message = "At least one availability zone must be provided."
  }
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets"

  validation {
    condition     = length(var.public_subnet_cidrs) == length(var.azs)
    error_message = "public_subnet_cidrs must match the number of availability zones."
  }
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets"

  validation {
    condition     = length(var.private_subnet_cidrs) == length(var.azs)
    error_message = "private_subnet_cidrs must match the number of availability zones."
  }
}

variable "enable_nat_gateway" {
  type        = bool
  default     = true
  description = "Whether to create a NAT gateway for private subnets"
}

variable "name" {
  type        = string
  description = "Base name used for all VPC resources"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags applied to all resources"
}
# VPC Flow Logs Variables
variable "enable_flow_logs" {
  type        = bool
  default     = false
  description = "Enable VPC Flow Logs"
}

variable "flow_log_traffic_type" {
  type        = string
  default     = "ALL"
  description = "Traffic type for flow logs (ACCEPT, REJECT, ALL)"

  validation {
    condition     = contains(["ACCEPT", "REJECT", "ALL"], var.flow_log_traffic_type)
    error_message = "flow_log_traffic_type must be one of ACCEPT, REJECT, or ALL."
  }
}

variable "flow_log_retention_days" {
  type        = number
  default     = 14
  description = "CloudWatch log retention in days for VPC flow logs"
}