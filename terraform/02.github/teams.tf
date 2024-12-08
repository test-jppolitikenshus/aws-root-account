# Everyone
module "idp_team" {
  source      = "./../modules/team"
  name        = "idp"
  description = "Platform Team"
  repositories = [
    #module.aws_root_account.repository.name,
    #module.template-repository.repository.name,
    #module.cloud-platform-terraform-module-template.repository.name,
    #module.cloud-platform.repository.name,
    #module.cloud-platform-terraform-baseline.repository.name,
  ]

  maintainers = local.maintainers
  members     = local.everyone
}

# People who need full AWS access
module "cloud_team" {
  source      = "./../modules/team"
  name        = "platform-engineers"
  description = "Platform Team: people who require AWS access"

  maintainers = local.maintainers
  members     = local.engineers

  parent_team_id = module.idp_team.team_id
}

module "security_team" {
  source      = "./../modules/team"
  name        = "platform-security"
  description = "Platform security review team"

  maintainers = local.maintainers
  members     = local.security
}

module "long_term_storage" {
  source      = "./../modules/team"
  name        = "platform-long_term_storage"
  description = "Platform long_term_storage team"

  maintainers = local.maintainers
  members     = local.long_term_storage
}

# Allow github users to contribute to our repos
#module "contributor-access" {
#  for_each          = toset(local.cloud_platform_repositories)
#  source            = "./../modules/contributor"
#  application_teams = local.application_github_slugs
#  repository_id     = each.key
#}
