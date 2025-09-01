locals {
  oidc = var.oidc != "" ? split("/", var.oidc)[4] : ""
  
  # Configurações específicas por ambiente
  environment_config = {
    dev = {
      node_group_desired_size = 1
      node_group_max_size     = 2
      node_group_min_size     = 1
      instance_types          = ["t3.medium"]
    }
    hml = {
      node_group_desired_size = 2
      node_group_max_size     = 3
      node_group_min_size     = 1
      instance_types          = ["t3.medium"]
    }
    prod = {
      node_group_desired_size = 3
      node_group_max_size     = 10
      node_group_min_size     = 3
      instance_types          = ["t3.large"]
    }
  }
  
  current_env = local.environment_config[terraform.workspace]
}