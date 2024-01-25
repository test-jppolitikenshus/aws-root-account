terraform {
  required_version = "<1.6"
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


