terraform {
  required_version = "~> 1.0"
  required_providers {
    github = {
      version = "6.2.3"
      source  = "integrations/github"
    }
  }
}
