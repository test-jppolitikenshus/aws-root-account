terraform {
  #required_version = "<1.6"
  backend "s3" {
    region         = "eu-north-1"
    encrypt        = "true"
    bucket         = "jppol-${var.tf_aws_account_name}-${var.tf_stage}-terraform-state"
    dynamodb_table = "jppol-${var.tf_aws_account_name}-${var.tf_stage}-terraform-state-lock"
    key            = "aws-${var.tf_aws_account_name}-account/${var.tf_module}"
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
      "stage"              = var.tf_stage,
      "cost_center"        = var.tf_cost_center,
      "repository"         = var.tf_repo,
      "root_module"        = var.tf_module,
      "aws_account_number" = var.tf_aws_account_number,
      "github_org"         = var.tf_github_org,
    }
  }
}
