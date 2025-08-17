
variable "project_name" {
  type        = string
  description = "Project name for tagging resources"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to assign to the resources"
}

variable "oidc" {
  type        = string
  description = "HTTPS URL from OIDC provider of the EKS cluster"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}