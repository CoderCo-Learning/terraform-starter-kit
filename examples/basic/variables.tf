# NOTE: Default values in this file are placeholders for example usage only and MUST be replaced with valid values before applying in a real environment.

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro" 
}

variable "ami_id" {
  description = "AMI ID to use for the instance"
  type        = string
  default     = "ami-0123456789abcdef0"
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instance"
  type        = string
  default     = "subnet-0123456789abcdef0" 
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = ["sg-0123456789abcdef0"]
}

variable "region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "eu-west-2"
}

variable "key_name" {
  type        = string
  default     = null
  description = "Optional EC2 key pair name"
}

