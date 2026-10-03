output "repository_url" { value = aws_ecr_repository.app.repository_url }
output "viewer_role_arn" { value = aws_iam_role.viewer.arn }
output "outsider_role_arn" { value = aws_iam_role.outsider.arn }
