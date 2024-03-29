terraform {
  required_version = "<1.6"
  backend "s3" {
    region  = "eu-north-1"
    profile = ""
    encrypt = "true"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=5.32.1"
    }
  }
}
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
