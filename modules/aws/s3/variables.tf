variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "force_destroy" {
  description = "Whether to allow bucket deletion with objects inside"
  type        = bool
  default     = false
}
variable "enable_versioning" {
  type        = bool
  description = "Enable S3 bucket versioning"
  default     = false
}
variable "enable_encryption" {
  type        = bool
  description = "Enable server-side encryption for the bucket"
  default     = false
}

variable "kms_key_arn" {
  type        = string
  description = "KMS key ARN for SSE-KMS (optional)"
  default     = null
}