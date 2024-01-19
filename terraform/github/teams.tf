# Everyone
module "core-team" {
  source      = "./modules/team"
  name        = "cloudv2-platform"
  description = "Cloudv2 Platform Team"
  repositories = [
    module.aws-root-account.repository.name,
    #module.template-repository.repository.name,
    #module.cloudv2-platform-terraform-module-template.repository.name,
    #module.cloudv2-platform.repository.name,
    #module.cloudv2-platform-terraform-baseline.repository.name,
  ]

  maintainers = local.maintainers
  members     = local.everyone
}

# People who need full AWS access
module "aws-team" {
  source      = "./modules/team"
  name        = "cloudv2-platform-engineers"
  description = "Cloudv2 Platform Team: people who require AWS access"

  maintainers = local.maintainers
  members     = local.engineers

  parent_team_id = module.core-team.team_id
}

module "security-team" {
  source      = "./modules/team"
  name        = "cloudv2-platform-security"
  description = "Cloudv2 Platform security review team"

  maintainers = local.maintainers
  members     = local.security
}

module "long-term-storage" {
  source      = "./modules/team"
  name        = "cloudv2-platform-long-term-storage"
  description = "Cloudv2 Platform long-term-storage team"

  maintainers = local.maintainers
  members     = local.long-term-storage
}

# Allow github users to contribute to our repos
#module "contributor-access" {
#  for_each          = toset(local.cloudv2_platform_repositories)
#  source            = "./modules/contributor"
#  application_teams = local.application_github_slugs
#  repository_id     = each.key
#}
