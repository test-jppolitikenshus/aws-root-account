terraform {
  required_version = "<1.6"
  backend "s3" {
    region = "eu-north-1"
    #bucket         = "jppol-root-test-terraform-state"         # This value is local to ../stage/*
    #dynamodb_table = "jppol-root-test-terraform-state-lock"    # This value is local to ../stage/*
    #key            = "aws-root-account/00.github"              # This value is set at runtime based on <repo>/<module>
    profile = ""
    encrypt = "true"
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
  owner = var.github_org
  #app_auth { # GHA uses github app to perform changes to github, since GHA runner only have permissions to current repository
  #}
}




