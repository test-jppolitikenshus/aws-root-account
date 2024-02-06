## import tags
module "tags" {
  source      = "../modules/aws-tags/"
  repos       = var.repos
  module      = var.module
  cost_center = var.cost_center
  stage       = var.stage
}

variable "stage" {
  type        = string
  description = "gets the stage from TF_VAR_stage"
  default     = "test"
  validation {
    condition     = var.stage == "test" || var.stage == "prod"
    error_message = "stage must be either test or prod"
  }
}

variable "repos" {
  type        = string
  default     = ""
  description = "gets the repository name from TF_VAR_repos"
}

variable "module" {
  type        = string
  default     = ""
  description = "gets the root module from TF_VAR_module"
}

variable "cost_center" {
  type        = number
  description = "cost center code"

}
