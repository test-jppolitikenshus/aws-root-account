terraform {
  required_version = "< 1.6.0"

  backend "s3" {
    region  = "eu-north-1"
    bucket  = "jppol-root-test-terraform-state"
    key     = "aws-root-account/02.tfstate-backend"
    profile = ""
    encrypt = "true"

    dynamodb_table = "jppol-root-test-terraform-state-lock"
  }
}
