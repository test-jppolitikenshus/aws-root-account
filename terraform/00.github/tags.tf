## import tags
#module "tags" {
#  source                = "../modules/aws-tags/"
#  TF_repos              = var.TF_repos
#  TF_module             = var.TF_module
#  TF_cost_center        = var.TF_cost_center
#  TF_stage              = var.TF_stage
#  TF_aws_account_name   = var.TF_aws_account_name
#  TF_github_org         = var.TF_github_org
#  TF_aws_account_number = var.TF_aws_account_number
#}

variable "TF_aws_account_name" {
  type        = string
  description = "gets the account name from TF_VAR_TF_aws_account_name (for the s3 backend)"
}

variable "TF_stage" {
  type        = string
  description = "gets the stage from TF_VAR_TF_stage (also for the s3 backend)"
  validation {
    condition     = var.TF_stage == "test" || var.TF_stage == "prod"
    error_message = "stage must be either test or prod"
  }
}

variable "TF_module" {
  type        = string
  description = "gets the root module from TF_VAR_TF_module (for the s3 backend)"
}

