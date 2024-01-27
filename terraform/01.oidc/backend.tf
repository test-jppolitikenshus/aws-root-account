terraform {
  required_version = "<1.6"
  backend "s3" {
    region  = "eu-north-1"
    profile = ""
    encrypt = "true"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=5.32.1"
    }
  }
}
