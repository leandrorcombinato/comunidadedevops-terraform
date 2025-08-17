variable "cidr_block" {
  type        = string
  description = "Networking CIDR block to used for the VPC"
}

variable "project_name" {
  type        = string
  description = "Project name to used to name the resources (Name tag)"
}

variable "region" {
  type        = string
  description = "AWS region to create the resources"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to add to all AWS resources"
}