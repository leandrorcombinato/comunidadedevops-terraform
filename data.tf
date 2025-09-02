# Data source para buscar a AMI mais recente do Ubuntu 22.04 LTS
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical (Ubuntu)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*22.04*-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

# Data source para Ubuntu 20.04 LTS (caso precise de uma versão específica)
data "aws_ami" "ubuntu_20_04" {
  most_recent = true
  owners      = ["099720109477"] # Canonical (Ubuntu)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-*20.04*-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# Data source para informações da região atual
data "aws_region" "current" {}

# Data source para informações da conta AWS atual
data "aws_caller_identity" "current" {}

# Data source para availability zones disponíveis na região
data "aws_availability_zones" "available" {
  state = "available"
}

# Data source para obter informações do EKS optimized AMI (para comparação)
data "aws_ami" "eks_worker" {
  most_recent = true
  owners      = ["602401143452"] # Amazon EKS AMI Account ID

  filter {
    name   = "name"
    values = ["amazon-eks-node-1.*-v*"] # Versão mais genérica
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# Remover ou comentar o VPC default se não for necessário
# data "aws_vpc" "default" {
#   default = true
# }
