#variable "tf_aws_account_number" {
#  type        = number
#  description = "AWS account number"
#}
#
#variable "tf_aws_account_name" {
#  type        = string
#  description = "AWS account name"
#}
#
variable "tf_github_org" {
  type        = string
  description = "github_organisation"
}
#
#variable "tf_stage" {
#  type        = string
#  description = "get the stage from TF_VAR_tf_stage"
#  validation {
#    condition     = var.tf_stage == "test" || var.tf_stage == "prod"
#    error_message = "stage must be either test or prod"
#  }
#}
#
variable "repository" {
  type        = string
  default     = "asdfasdfasdf"
  description = "get the repository name from TF_VAR_tf_repo"
}
variable "tf_repo" {
  type        = string
  default     = "asdfasdf"
  description = "get the repository name from TF_VAR_tf_repo"
}

variable "tf_module" {
  type        = string
  default     = "asdf"
  description = "get the root module from TF_VAR_tf_module"
}

#variable "tf_cost_center" {
#  type        = number
#  description = "cost center code from TF_VAR_tf_cost_center"
#}

