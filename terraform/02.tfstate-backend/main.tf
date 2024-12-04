# You cannot create a new backend by simply defining this and then
# immediately proceeding to "terraform apply". The S3 backend must
# be bootstrapped according to the simple yet essential procedure in
# https://github.com/cloudposse/terraform-aws-tfstate-backend#usage
module "terraform_state_backend" {
  #checkov:skip=CKV_TF_1:Module registry does not support commit hashes for versions
  source               = "github.com/test-jppolitikenshus/cloudv2-platform-terraform-aws-tfstate-backend?ref=1.4.0"
  namespace            = "jppol"
  environment          = var.tf_aws_account_name # root, core, something
  stage                = var.tf_stage # test, dev, prod
  name                 = "terraform"
  attributes           = ["state"]
  terraform_state_file = "aws-var.tf_aws_account_name-account/02.tfstate-backend"

  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"
  force_destroy                      = false
}


