variable "cidr_block" {
    description = "value of the CIDR block for the VPC"
    type        = string
    default = ""
}

variable "env" {
    description = "Name of the VPC environment"
    type        = string
    default     = ""
}
