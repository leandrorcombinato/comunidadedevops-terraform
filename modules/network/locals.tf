locals {
  tags = {
    Department   = "DevOps"
    Organization = "Infraestrutura e Operações"
    Project      = "EKS"
    Environment  = "Development"
  }
  cidr_block   = "10.0.0.0/16"
  project_name = "eks-lab"
  region       = "us-east-1"
  oidc         = "" # Será preenchido automaticamente
}