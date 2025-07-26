variable "image_tag" {
  type        = string
  description = "Docker image tag to deploy"
}

variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "aws_account_id" {
  type        = string
  description = "Your AWS account ID (for ECR images)"
}
