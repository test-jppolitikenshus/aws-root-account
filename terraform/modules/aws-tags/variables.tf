variable "TF_aws_account_number" {
  type        = number
  description = "AWS account number"
}

variable "TF_aws_account_name" {
  type        = string
  description = "AWS account name"
}

variable "TF_github_org" {
  type        = string
  description = "github_organisation"
}

variable "TF_stage" {
  type        = string
  description = "get the stage from TF_VAR_TF_stage"
  validation {
    condition     = var.TF_stage == "test" || var.TF_stage == "prod"
    error_message = "stage must be either test or prod"
  }
}

variable "TF_repos" {
  type        = string
  description = "get the repository name from TF_VAR_TF_repos"
}

variable "TF_module" {
  type        = string
  description = "get the root module from TF_VAR_TF_module"
}

variable "TF_cost_center" {
  type        = number
  description = "cost center code from TF_VAR_TF_cost_center"
}

