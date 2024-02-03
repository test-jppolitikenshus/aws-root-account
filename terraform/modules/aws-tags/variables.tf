variable "aws_account" {
  type        = string
  default     = ""
  description = "AWS account"
}

variable "github_org" {
  type        = string
  default     = ""
  description = "github_organisation"
}

variable "stage" {
  type        = string
  description = "get the stage from TF_VAR_stage"
  validation {
    condition     = var.stage == "test" || var.stage == "prod"
    error_message = "stage must be either test or prod"
  }
}

variable "repos" {
  type        = string
  description = "get the repository name from TF_VAR_repos"
}

variable "module" {
  type        = string
  description = "get the root module from TF_VAR_module"
}

variable "cost_center" {
  type        = number
  description = "cost center code"
}

