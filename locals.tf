locals {
  oidc = var.oidc != "" ? split("/", var.oidc)[4] : ""

  # Configurações específicas por ambiente
  environment_config = {
    dev = {
      node_group_desired_size = 1
      node_group_max_size     = 2
      node_group_min_size     = 1
      instance_types          = ["t3.medium"]
      environment_name        = "dev"
      full_name               = "comunidadedevops-dev"
      ami_id                  = data.aws_ami.ubuntu.id
      ami_name                = data.aws_ami.ubuntu.name
    }
    hml = {
      node_group_desired_size = 2
      node_group_max_size     = 3
      node_group_min_size     = 1
      instance_types          = ["t3.medium"]
      environment_name        = "hml"
      full_name               = "comunidadedevops-hml"
      ami_id                  = data.aws_ami.ubuntu.id
      ami_name                = data.aws_ami.ubuntu.name
    }
    prod = {
      node_group_desired_size = 3
      node_group_max_size     = 10
      node_group_min_size     = 3
      instance_types          = ["t3.large"]
      environment_name        = "prod"
      full_name               = "comunidadedevops-prod"
      ami_id                  = data.aws_ami.ubuntu.id
      ami_name                = data.aws_ami.ubuntu.name
    }
  }

  current_env = local.environment_config[terraform.workspace]

  # Informações da AMI Ubuntu para uso nos módulos
  ubuntu_info = {
    ami_id         = data.aws_ami.ubuntu.id
    ami_name       = data.aws_ami.ubuntu.name
    creation_date  = data.aws_ami.ubuntu.creation_date
    description    = data.aws_ami.ubuntu.description
    architecture   = data.aws_ami.ubuntu.architecture
    virtualization = data.aws_ami.ubuntu.virtualization_type
    owner_id       = data.aws_ami.ubuntu.owner_id
  }

  # Informações do ambiente atual
  environment_info = {
    workspace          = terraform.workspace
    project_name       = local.current_env.full_name
    environment        = local.current_env.environment_name
    region             = data.aws_region.current.name
    account_id         = data.aws_caller_identity.current.account_id
    availability_zones = data.aws_availability_zones.available.names
  }
}