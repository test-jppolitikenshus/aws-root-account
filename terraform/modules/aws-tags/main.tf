provider "aws" {
  default_tags {
    tags = {
      "terraform"          = "true",
      "deploy_ref"         = path.cwd,
      "stage"              = var.TF_stage,
      "cost_center"        = var.TF_cost_center,
      "repository"         = var.TF_repo,
      "repository2"        = repository2value,
      "root_module"        = var.TF_module,
      "aws_account_number" = ${var.TF_aws_account_number},
      "aws_account_name"   = var.TF_aws_account_name,
      "github_org"         = var.TF_github_org
    }
  }
}
