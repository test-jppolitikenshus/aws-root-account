provider "aws" {
  default_tags {
    tags = {
      "terraform"          = "true",
      "deploy_ref"         = path.cwd,
      "stage"              = var.stage, # takes stage name from env var $TF_VAR_stage
      "cost_center"        = var.cost_center,
      "repository"         = var.repos,
      "root_module"        = var.module
      "aws_account_number" = var.aws_account
      "github_org"         = var.github_org

    }
  }
}
