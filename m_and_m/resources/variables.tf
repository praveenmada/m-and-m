
#IAM Variables for m-and-m
variable "iam_role_name" {
  description = "The name of the IAM role"
  type        = string
  default     = "m-and-m-operator"
  sensitive   = true
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "policy_name" {
  description = "The name of the IAM policy"
  type        = string
  default     = "m-and-m-operator-policy"
  sensitive   = true
}