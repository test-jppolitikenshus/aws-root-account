
# Define settings for the GitHub organization
resource "github_organization_settings" "default_org_settings" {
  name          = "JP/Politikens Hus"
  billing_email = "platform@jppol.dk"
  company       = "JP/Politikens Hus"
  blog          = "https://jppol.dk"
  location      = "Denmark"
  #advanced_security_enabled_for_new_repositories               = true # disabled, public repos automatically has advanced security enabled
  has_organization_projects                                    = true
  has_repository_projects                                      = true
  web_commit_signoff_required                                  = false # when both org and repos enforce signoff, it wants to turn off - race condition in state between repos and org complicates it further  - also GHA and terraform needs a way to sign commits: https://github.com/actions/runner/issues/667
  dependabot_alerts_enabled_for_new_repositories               = true
  dependabot_security_updates_enabled_for_new_repositories     = true
  dependency_graph_enabled_for_new_repositories                = true
  secret_scanning_enabled_for_new_repositories                 = true
  secret_scanning_push_protection_enabled_for_new_repositories = true
}

#output "github_organization_settings-2fa-reminder" {
#  description = "something"
#  value       = <<EOT
#************* Manually settings required:
#- enforce 2FA in org: https://github.com/organizations/${var.github_org}/settings/security
#- enable "Private vulnerability reporting for new public repositories"
#- "Code scanning" and "Recommend the extended query suite for repositories enabling default setup"
#*************
#EOT
#}

#output "testing123" {
#  description = "testing123"
#  value       = "testing123"
#}

# Add user to the organization
resource "github_membership" "org_membership_for_kristoffer" {
  username = "Kristoffer"
  role     = "admin"
}

## Template repositories is defined outside of the repository module due to bootstrap race issues
#resource "github_repository" "aws-root-account" {
#  name            = "aws-root-account"
#  description     = "This is the repository for the aws-root-account"
#  visibility      = "private"
#  template {
#    owner      = "commercial-tech"
#    repository = "template-aws-root-account"
#  }
#}
#resource "github_repository" "template-repository" {
#  name            = "template-repository"
#  description     = "This is a terraform template repository"
#  is_template     = true
#  template {
#    owner      = "commercial-tech"
#    repository = "template-template-repository"
#  }
#}
#resource "github_repository" "cloudv2-platform-terraform-module-template" {
#  name            = "cloudv2-platform-terraform-module-template"
#  description     = "This is a terraform module template repository"
#  is_template     = true
#  template {
#    owner      = "commercial-tech"
#    repository = "template-cloudv2-platform-terraform-module-template"
#  }
#}



## Add a teams to the organization
#resource "github_team" "platform-team" {
#  name        = "cloudv2-platform-team"
#  description = "Platform Team"
#  privacy     = "closed"
#}
#
#resource "github_team" "security-team" {
#  name        = "cloudv2-security-team"
#  description = "Security Team"
#  privacy     = "closed"
#}
#
#resource "github_team" "backup-team" {
#  name        = "backup-team"
#  description = "Backup Team"
#  privacy     = "closed"
#}




#resource "github_team_membership" "membership_for_platform_team" {
#  team_id  = github_team.platform-team.id
#  username = "Kristoffer"
#  role     = "maintainer"
#}


#resource "github_repository" "cloudv2-platform" {
#  name                   = "cloudv2-platform"
#  description            = "This is the repository for the cloudv2 Platform"
#  visibility             = "public"
#  auto_init              = true
#  has_discussions        = true
#  has_downloads          = true
#  has_issues             = true
#  has_projects           = true
#  allow_auto_merge       = true
#  allow_update_branch    = true
#  delete_branch_on_merge = true
#  pages {
#    source {
#      branch = "main"
#      path   = "/docs"
#    }
#  }
#  lifecycle {
#    prevent_destroy = false
#  }
#}

#resource "github_repository" "jppol-discussions" {
#  name            = "jppol-discussions"
#  description     = "This private repository contains the cross repository discussions"
#  visibility      = "private"
#  auto_init       = true
#  has_discussions = true
#  has_downloads   = true
#  has_issues      = true
#  has_projects    = true
#  lifecycle {
#    prevent_destroy = false
#  }
#}


# resource "github_branch_protection_v3" "default_public_protection" {
#   repository                      = "cloudv2-platform"
#   branch                          = "main"
#   enforce_admins                  = true
#   require_conversation_resolution = true
#   require_signed_commits          = true
#   required_pull_request_reviews {
#     dismiss_stale_reviews           = true
#     dismissal_apps                  = []
#     dismissal_teams                 = []
#     dismissal_users                 = []
#     require_code_owner_reviews      = true
#     required_approving_review_count = 1
#   }
#   required_status_checks {
#     checks = []
#     strict = true
#   }
# }
# 
# resource "github_repository_ruleset" "default_ruleset" {
#   name        = "Default ruleset"
#   repository  = github_repository.cloudv2-platform.name
#   target      = "branch"
#   enforcement = "active"
#   rules {
#     creation                = false
#     non_fast_forward        = true
#     update                  = false
#     deletion                = true
#     required_linear_history = true
#     required_signatures     = true
#     required_deployments {
#       required_deployment_environments = ["Production"]
#     }
#     pull_request {
#       dismiss_stale_reviews_on_push     = true
#       require_code_owner_review         = true
#       require_last_push_approval        = true
#       required_approving_review_count   = 1
#       required_review_thread_resolution = true
#     }
#   }
#   conditions {
#     ref_name {
#       exclude = []
#       include = [
#         "~ALL"
#       ]
#     }
#   }
# }
# 
# 
# resource "github_repository_environment" "cloudv2-platform_prod_environment" {
#   environment  = "Production"
#   repository   = github_repository.cloudv2-platform.name
#   deployment_branch_policy {
#     protected_branches          = false
#     custom_branch_policies = true
#   }
# }
