#output "github_org" {
#  description = "Which github organisation is configured"
#  value       = var.tf_github_org
#}

#output "aws_account" {
#  description = "Which aws account is configured"
#  value       = var.aws_account
#}
#
#
#output "stage" {
#  description = "gets the stage from TF_VAR_stage"
#  value       = var.stage
#}
#
output "repository" {
  description = "gets the repository name from TF_VAR_repos"
  value       = var.tf_repo
}

#output "module" {
#  description = "gets the root module from TF_VAR_module"
#  value       = var.module
#}
#
#output "cost_center" {
#  description = "cost center code"
#  value       = var.cost_center
#}

