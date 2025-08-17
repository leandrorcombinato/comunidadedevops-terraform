
variable "project_name" {
  type        = string
  description = "Project name for tagging resources"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to assign to the resources"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name to creat MNG"
}

variable "subnet_private_1a" {
  type        = string
  description = "Subnet ID from AZ 1a"
}

variable "subnet_private_1b" {
  type        = string
  description = "Subnet ID from AZ 1b"
}
