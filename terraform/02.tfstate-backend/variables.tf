variable "tf_stage" {
  type        = string
  description = "gets the stage from TF_VAR_tf_stage"
  validation {
    condition     = var.tf_stage == "test" || var.tf_stage == "prod"
    error_message = "stage must be either test or prod"
  }
}

variable "tf_repo" {
  type        = string
  description = "gets the repository name from TF_VAR_tf_repo"
}

#variable "tf_module" {
#  type        = string
#  description = "gets the root module from TF_VAR_tf_module"
#}
#
#variable "tf_cost_center" {
#  type        = number
#  description = "gets the cost center code from TF_VAR_tf_cost_center"
#}


