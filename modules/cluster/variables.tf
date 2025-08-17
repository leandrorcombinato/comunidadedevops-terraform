
variable "project_name" {
  type        = string
  description = "Project name for tagging resources"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to assign to the resources"
}

variable "public_subnet_1a" {
  type        = string
  description = "Public subnet ID in availability zone 1a"
}

variable "public_subnet_1b" {
  type        = string
  description = "Public subnet ID in availability zone 1b"
}
