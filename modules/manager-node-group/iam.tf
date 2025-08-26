resource "aws_iam_role" "eks_mng_role" {
  name = "${var.project_name}-mng-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-mng-role"
    }
  )
}

resource "aws_iam_policy_attachment" "eks_mng_role_attachment_worker" {
  name       = "${var.project_name}-cluster-role-attachment"
  roles      = [aws_iam_role.eks_mng_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_policy_attachment" "eks_mng_role_attachment_ecr" {
  name       = "${var.project_name}-cluster-role-attachment"
  roles      = [aws_iam_role.eks_mng_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_policy_attachment" "eks_mng_role_attachment_cni" {
  name       = "${var.project_name}-cluster-role-attachment"
  roles      = [aws_iam_role.eks_mng_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}