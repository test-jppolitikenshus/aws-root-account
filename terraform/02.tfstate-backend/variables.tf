variable "TF_stage" {
  type        = string
  description = "gets the stage from TF_VAR_TF_stage"
  validation {
    condition     = var.TF_stage == "test" || var.TF_stage == "prod"
    error_message = "stage must be either test or prod"
  }
}

variable "TF_repo" {
  type        = string
  description = "gets the repository name from TF_VAR_TF_repo"
}

#variable "TF_module" {
#  type        = string
#  description = "gets the root module from TF_VAR_TF_module"
#}
#
#variable "TF_cost_center" {
#  type        = number
#  description = "gets the cost center code from TF_VAR_TF_cost_center"
#}


