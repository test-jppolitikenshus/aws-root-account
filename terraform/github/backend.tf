terraform {
  required_version = "<1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=5.32.1"
    }
    github = {
      source  = "integrations/github"
      version = "6.0.0-alpha"
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

# Configure the GitHub Provider
#  access to Github Organisation is via GitHub CLI (gh auth login)
provider "github" {
  owner = local.github_org
}


