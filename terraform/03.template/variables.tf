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

variable "TF_aws_account_number" {
  type        = number
  description = "AWS account number"
}

variable "TF_cost_center" {
  type        = string
  description = "Cost center"
}

variable "TF_github_org" {
  type        = string
  description = "GitHub organization"
}

variable "TF_repo" {
  type        = string
  description = "GitHub repository"
}

variable "TF_team" {
  type        = string
  description = "The name of the team"
  default     = "Cloud Team"
}