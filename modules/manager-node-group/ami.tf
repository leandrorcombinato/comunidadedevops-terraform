# Data source local para Ubuntu no módulo
data "aws_ami" "ubuntu_local" {
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

# Launch template para as instâncias
resource "aws_launch_template" "node_group_template" {
  name_prefix   = "${var.project_name}-template-"
  image_id      = var.ami_id != "" ? var.ami_id : data.aws_ami.ubuntu_local.id
  instance_type = var.instance_types[0]

  vpc_security_group_ids = [aws_security_group.node_group_sg.id]

  user_data = base64encode(templatefile("${path.module}/user-data.sh", {
    cluster_name = var.cluster_name
    project_name = var.project_name
  }))

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.tags, {
      Name = "${var.project_name}-node"
      Type = "EKS-Node"
      OS   = "Ubuntu 22.04 LTS"
    })
  }

  tag_specifications {
    resource_type = "volume"
    tags = merge(var.tags, {
      Name = "${var.project_name}-node-volume"
    })
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-launch-template"
  })
}

# Security group para os nodes
resource "aws_security_group" "node_group_sg" {
  name        = "${var.project_name}-node-group-sg"
  description = "Security group for EKS node group"
  vpc_id      = data.aws_vpc.cluster_vpc.id

  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-node-group-sg"
  })
}

# Data source para obter informações da VPC criada pelo módulo network
data "aws_vpc" "cluster_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.project_name}-vpc"]
  }
}