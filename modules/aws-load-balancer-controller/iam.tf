resource "aws_iam_role" "eks_controller_role" {
  name = "${var.project_name}-aws_load-balancer-controller"

  assume_role_policy = <<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Principal": {
            "Federated": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${locals.oidc}"
          },
          "Action": "sts:AssumeRoleWithWebIdentity",
          "Condition": {
            "StringEquals": {
              "oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${locals.oidc}:aud": "sts:amazon.com",
              "oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${locals.oidc}:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
            }
          }
        },
        {
          "Effect": "Allow",
          "Principal": {
            "Service": "eks.amazonaws.com"
          },
          "Action": "sts:AssumeRole"
        }
      ]
    }
  EOF

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-aws_load-balancer-controller"
    }
  )
}