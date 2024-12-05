module "tags" {
  source = "../modules/aws-tags/"

  #tf_repo    = var.tf_repo
  #repository = "repository2value2"
  #module      = var.tf_module
  #cost_center = var.tf_cost_center
  #stage       = var.tf_stage
  github_org = var.tf_github_org
}


