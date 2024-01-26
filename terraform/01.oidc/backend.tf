terraform {
  required_version = "<1.6"
  backend "s3" {
    region  = "eu-north-1"
    bucket  = "jppol-root-test-terraform-state"
    key     = "aws-root-account/01.oidc"
    profile = ""
    encrypt = "true"

    dynamodb_table = "jppol-root-test-terraform-state-lock"
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
      owner     = local.github_org
      terraform = "true"
    }
  }
}

