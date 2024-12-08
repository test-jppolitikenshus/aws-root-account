terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    region  = "eu-north-1"
    bucket  = "jppol-${var.tf_aws_account_name}-${var.tf_stage}-terraform-state"
    key     = "aws-${var.tf_aws_account_name}-account/02.tfstate-backend"
    profile = ""
    encrypt = "true"

    dynamodb_table = "jppol-${var.tf_aws_account_name}-${var.tf_stage}-terraform-state-lock"
  }
}
