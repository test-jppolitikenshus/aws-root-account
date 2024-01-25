terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    region  = "eu-north-1"
    bucket  = "pt-test-terraform-state"
    key     = "terraform.tfstate"
    profile = ""
    encrypt = "true"

    dynamodb_table = "pt-test-terraform-state-lock"
  }
}
