variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "project_name" {
  type        = string
  description = "Project name for tagging resources"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to assign to the resources"
}