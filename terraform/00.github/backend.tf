terraform {
  required_version = "<1.6"
  backend "s3" {
    region  = "eu-north-1"
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
  app_auth { # GHA uses github app to perform changes to github, since GHA runner only have permissions to current repository
  }
}




