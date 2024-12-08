provider "aws" {
  default_tags {
    tags = {
      "terraform"          = "true",
      "deploy_ref"         = path.cwd,
      "stage"              = var.tf_stage,
      "cost_center"        = var.tf_cost_center,
      "repository"         = var.tf_repo,
      "repository2"        = repository2value,
      "root_module"        = var.tf_module,
      "aws_account_number" = var.tf_aws_account_number,
      "aws_account_name"   = var.tf_aws_account_name,
      "github_org"         = var.tf_github_org
    }
  }
}

data "aws_caller_identity" "current" {}

locals {
  tags = {
    "terraform"          = "true",
    "deploy_ref"         = path.cwd,
    "stage"              = var.tf_stage,
    "cost_center"        = var.tf_cost_center,
    "repository"         = var.tf_repo,
    "repository2"        = repository2value,
    "root_module"        = var.tf_module,
    "aws_account_number" = var.tf_aws_account_number,
    "aws_account_name"   = var.tf_aws_account_name,
    "github_org"         = var.tf_github_org
    DeployedBy  = data.aws_caller_identity.current.arn
  }
}
