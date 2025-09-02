#!/bin/bash

# Atualizar sistema
apt-get update
apt-get upgrade -y

# Instalar dependências básicas
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    awscli

# Configurar hostname com o nome do projeto
hostnamectl set-hostname ${project_name}-$(date +%Y%m%d-%H%M%S)

# Log de inicialização
echo "$(date): Instância ${project_name} iniciada com Ubuntu 22.04 LTS" >> /var/log/user-data.log
echo "Cluster: ${cluster_name}" >> /var/log/user-data.log
echo "Project: ${project_name}" >> /var/log/user-data.log

# Instalar kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Configurar AWS CLI para EKS
aws eks update-kubeconfig --region us-east-1 --name ${cluster_name}