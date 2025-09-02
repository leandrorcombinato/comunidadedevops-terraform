output "subnet_pub_1a" {
  description = "Public subnet 1a ID"
  value       = aws_subnet.eks_subnet_public_1a.id
}

output "subnet_pub_1b" {
  description = "Public subnet 1b ID"
  value       = aws_subnet.eks_subnet_public_1b.id
}

output "subnet_priv_1a" {
  description = "Private subnet 1a ID"
  value       = aws_subnet.eks_subnet_private_1a.id
}

output "subnet_priv_1b" {
  description = "Private subnet 1b ID"
  value       = aws_subnet.eks_subnet_private_1b.id
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.eks_vpc.id
}