variable "tf_aws_account_name" {
  type        = string
  description = "gets the account name from TF_VAR_tf_aws_account_name (for the s3 backend)"
}

variable "tf_stage" {
  type        = string
  description = "gets the stage from TF_VAR_tf_stage (also for the s3 backend)"
  validation {
    condition     = var.tf_stage == "test" || var.tf_stage == "prod"
    error_message = "stage must be either test or prod"
  }
}

variable "tf_module" {
  type        = string
  description = "gets the root module from TF_VAR_tf_module (for the s3 backend)"
}

# used in gh action
# tflint-ignore: terraform_unused_declarations
variable "tf_aws_account_number" {
  type        = number
  description = "AWS account number"
}

# used in gh action
# tflint-ignore: terraform_unused_declarations
variable "tf_cost_center" {
  type        = string
  description = "Cost center testing 123"
}

# used in gh action
# tflint-ignore: terraform_unused_declarations
variable "tf_github_org" {
  type        = string
  description = "GitHub organization"
}

# used in gh action
# tflint-ignore: terraform_unused_declarations
variable "tf_repo" {
  type        = string
  description = "GitHub repository"
}

# used in gh action
# tflint-ignore: terraform_unused_declarations
variable "tf_pull_request" {
  type        = string
  description = "The name of the team"
  default     = "Cloud Team"
}
