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

# Novas variáveis para configuração personalizada
variable "desired_size" {
  type        = number
  description = "Desired number of nodes in the node group"
  default     = 2
}

variable "max_size" {
  type        = number
  description = "Maximum number of nodes in the node group"
  default     = 4
}

variable "min_size" {
  type        = number
  description = "Minimum number of nodes in the node group"
  default     = 1
}

variable "instance_types" {
  type        = list(string)
  description = "List of instance types for the node group"
  default     = ["t3.medium"]
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the node group instances"
  default     = ""
}
