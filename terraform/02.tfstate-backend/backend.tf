terraform {
  required_version = "< 1.6.0"
  required_providers {
    local = { version = "2.4.1" }
    aws   = { version = "5.33.0" }
    time  = { version = "0.10.0" }
  }
  backend "s3" {
    region  = "eu-north-1"
    bucket  = "pt-test-terraform-state"
    key     = "terraform.tfstate"
    profile = ""
    encrypt = "true"

    dynamodb_table = "pt-test-terraform-state-lock"
  }
}




