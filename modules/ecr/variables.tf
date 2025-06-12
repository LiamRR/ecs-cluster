variable "proj_name" {
  description = "Name of the project"
  type        = string
}

variable "mutability" {
  description = "Image mutability"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "repositories" {
  description = "List of ECR repositories to create"
  type        = list(string)
}
