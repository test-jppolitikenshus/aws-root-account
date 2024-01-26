terraform {
  required_version = "<1.6"
  backend "s3" {
    region  = "eu-north-1"
    bucket  = "jppol-root-test-terraform-state"
    key     = "aws-root-account/00.github"
    profile = ""
    encrypt = "true"

    dynamodb_table = "jppol-root-test-terraform-state-lock"
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.0.0-alpha"
    }
  }
}

# Configure the GitHub Provider
#  access to Github Organisation is via GitHub CLI (gh auth login)
provider "github" {
  owner = local.github_org
}


