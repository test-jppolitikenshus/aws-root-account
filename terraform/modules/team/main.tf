
locals {
  maintainers = toset([
    for user in var.maintainers :
    user
    if contains(var.members, user)
  ])

  members = toset([
    for user in var.members :
    user
    if !contains(var.maintainers, user)
  ])
}


resource "github_team" "default" {
  name                      = var.name
  privacy                   = "closed"
  description               = join(" • ", [var.description, "This team is defined and managed in Terraform"])
  parent_team_id            = var.parent_team_id
  create_default_maintainer = true
}

# Team memberships (as "maintainers")
resource "github_team_membership" "maintainers" {
  for_each = local.maintainers
  team_id  = github_team.default.id
  username = each.value
  role     = "maintainer"
}

# Team memberships (as "members")
resource "github_team_membership" "members" {
  for_each = local.members
  team_id  = github_team.default.id
  username = each.value
  role     = "member"
}

# Repositories to give access to
resource "github_team_repository" "default" {
  for_each   = var.repositories
  team_id    = github_team.default.id
  repository = each.value
  permission = "admin"
}
