## import tags
module "tags" {
  source = "../modules/aws-tags/"

  TF_repo    = var.TF_repo
  repository = "repository2value2"
  #module      = var.TF_module
  #cost_center = var.TF_cost_center
  #stage       = var.TF_stage
}

