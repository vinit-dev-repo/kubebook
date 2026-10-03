resource "aws_ecr_repository" "app" {
  name         = var.key
  force_delete = true
}

resource "aws_iam_role" "pod" {
  name = "${var.key}-pod"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Principal = { Service = "pods.eks.amazonaws.com" }, Action = ["sts:AssumeRole", "sts:TagSession"] }]
  })
}

resource "aws_iam_role_policy" "pod" {
  name = "read-the-repository"
  role = aws_iam_role.pod.id
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = ["ecr:DescribeRepositories"], Resource = aws_ecr_repository.app.arn }]
  })
}

resource "aws_eks_pod_identity_association" "app" {
  cluster_name    = module.eks.cluster_name
  namespace       = var.key
  service_account = "app"
  role_arn        = aws_iam_role.pod.arn
}
