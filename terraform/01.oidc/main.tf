resource "aws_iam_openid_connect_provider" "default" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = ["1b511abead59c6ce207077c0bf0e0043b1382612"]
}


##  web identity role for GitHub Actions
resource "aws_iam_role" "oidc_role" {
  name = "AWS-GitHubActions-OIDC_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::${var.aws_account}:oidc-provider/token.actions.githubusercontent.com"
        },
        Condition = {
          StringEquals = { # no wildcard
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          },
          StringLike = { # wildcard ok
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_org}/aws-root-account:*"
            #"token.actions.githubusercontent.com:sub" = "repo:test-jppolitikenshus/aws-root-account:ref:refs/heads/main" # Main
            #"token.actions.githubusercontent.com:sub" = "repo:${local.github_org}/aws-root-account:pull_request" # PR
          }
        }
      },
    ]
  })
}


## add permissions to web identity role
resource "aws_iam_role_policy_attachment" "oidc_role_policy_attachment" {
  role       = aws_iam_role.oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}




