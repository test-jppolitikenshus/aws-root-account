terraform {
  #required_version = "<1.6"
  backend "s3" {
    region         = "eu-north-1"
    encrypt        = "true"
    bucket         = "jppol-${var.TF_aws_account_name}-${var.TF_stage}-terraform-state"
    dynamodb_table = "jppol-${var.TF_aws_account_name}-${var.TF_stage}-terraform-state-lock"
    key            = "aws-${var.TF_aws_account_name}-account/${var.TF_module}"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.6"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      "terraform"          = "true",
      "deploy_ref"         = path.cwd,
      "stage"              = var.TF_stage,
      "cost_center"        = var.TF_cost_center,
      "repository"         = var.TF_repo,
      "root_module"        = var.TF_module,
      "aws_account_number" = var.TF_aws_account_number,
      "github_org"         = var.TF_github_org,
    }
  }
}
