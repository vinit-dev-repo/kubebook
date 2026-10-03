data "aws_caller_identity" "me" {}

resource "aws_iam_role" "viewer" {
  name = "${var.key}-viewer"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{ Effect = "Allow", Principal = { AWS = "arn:aws:iam::${data.aws_caller_identity.me.account_id}:root" }, Action = "sts:AssumeRole" }]
  })
}

# a role with no access entry, to show the refusal
resource "aws_iam_role" "outsider" {
  name = "${var.key}-outsider"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{ Effect = "Allow", Principal = { AWS = "arn:aws:iam::${data.aws_caller_identity.me.account_id}:root" }, Action = "sts:AssumeRole" }]
  })
}

resource "aws_eks_access_entry" "viewer" {
  cluster_name  = module.eks.cluster_name
  principal_arn = aws_iam_role.viewer.arn
}

resource "aws_eks_access_policy_association" "viewer" {
  cluster_name  = module.eks.cluster_name
  principal_arn = aws_iam_role.viewer.arn
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
  access_scope { type = "cluster" }
  depends_on = [aws_eks_access_entry.viewer]
}
