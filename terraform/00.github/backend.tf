terraform {
  required_version = "<1.6"
  backend "s3" {
    region  = "eu-north-1"
    encrypt = "true"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.3"
    }
  }
}

provider "github" {
  #owner = var.github_org # `GITHUB_OWNER`
  app_auth { # GHA uses github app to perform changes to github, since GHA runner only have permissions to current repository
    #id              = var.app_id              # or `GITHUB_APP_ID`
    #installation_id = var.app_installation_id # or `GITHUB_APP_INSTALLATION_ID`
    #pem_file        = var.app_pem_file        # or `GITHUB_APP_PEM_FILE`
  }
}


# To determine if GHA is running, check for CI and GITHUB_RUN_ID variables

