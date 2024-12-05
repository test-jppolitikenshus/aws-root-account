locals {

  # GitHub usernames for the Platform team maintainers
  # NB: Terraform shows a perputal difference in roles if someone is an organisation owner
  # and will attempt to change them from `maintainer` to `member`, so owners should go in here.
  maintainers = [
    "Kristoffer"
  ]

  # GitHub usernames for engineers who need full AWS access
  engineers = [
  ]

  # GitHub usernames for team members who don't need full AWS access
  members = [
    "test-kristoffer"
  ]

  # Security engineers performing reviews on the platform or member accounts
  security = [
  ]

  # Members of the long_term_storage account team to acccess that account
  long_term_storage = [
  ]

  # All members
  all_members = concat(local.members, local.engineers)

  # Everyone
  everyone = concat(local.maintainers, local.all_members)

  tf_aws_account_name = var.tf_aws_account_name
  tf_stage = var.tf_stage
  tf_module = var.tf_module
  tf_aws_account_number = var.tf_aws_account_number
  tf_cost_center = var.tf_cost_center
  tf_github_org = var.tf_github_org
  tf_repo = var.tf_repo
}



