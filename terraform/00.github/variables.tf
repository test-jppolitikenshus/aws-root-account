variable "github_org" {
  type        = string
  default     = ""
  description = "github_organisation"
}

#variable "github_token" {
#  type        = string
#  default     = ""
#  description = "github_token"
#}

#data "github_actions_environment_variables" "qwer" {
#  environment = "test"
#  name        = "aws_root_account"
#}
#
#output "zxcv" {
#  description = "asdf"
#  value       = data.github_actions_environment_variables.qwer.name
#}


