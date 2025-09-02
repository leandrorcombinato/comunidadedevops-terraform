module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = local.current_env.full_name
  tags         = var.tags
}

module "eks_cluster" {
  source           = "./modules/cluster"
  project_name     = local.current_env.full_name
  tags             = var.tags
  public_subnet_1a = module.eks_network.subnet_pub_1a
  public_subnet_1b = module.eks_network.subnet_pub_1b

  depends_on = [module.eks_network]
}

module "eks_manager_node_group" {
  source            = "./modules/manager-node-group"
  project_name      = local.current_env.full_name
  cluster_name      = module.eks_cluster.cluster_name
  subnet_private_1a = module.eks_network.subnet_priv_1a
  subnet_private_1b = module.eks_network.subnet_priv_1b
  tags = merge(var.tags, {
    NodeGroupType = "Manager"
    AMI           = data.aws_ami.ubuntu.name
    AMI_ID        = data.aws_ami.ubuntu.id
  })

  # Configurações específicas do ambiente
  desired_size   = local.current_env.node_group_desired_size
  max_size       = local.current_env.node_group_max_size
  min_size       = local.current_env.node_group_min_size
  instance_types = local.current_env.instance_types
  ami_id         = data.aws_ami.ubuntu.id

  depends_on = [module.eks_network, module.eks_cluster]
}

module "eks_load_balancer_controller" {
  source       = "./modules/aws-load-balancer-controller"
  project_name = local.current_env.full_name
  tags         = var.tags
  oidc         = module.eks_cluster.oidc
  cluster_name = module.eks_cluster.cluster_name

  depends_on = [module.eks_cluster]
}