terraform {
  required_version = "<1.6"
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

