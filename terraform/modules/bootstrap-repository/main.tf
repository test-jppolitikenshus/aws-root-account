locals {
  #  add github topics
  base_topics   = ["cloudv2-platform"]
  module_topics = ["terraform-module"]
  topics        = var.type == "core" ? local.base_topics : concat(local.base_topics, local.module_topics)
}

# Repository basics
resource "github_repository" "default" {
  name                   = var.name
  description            = join(" • ", [var.description, "This repository is defined and managed in Terraform"])
  homepage_url           = var.homepage_url
  visibility             = var.visibility
  has_issues             = true
  has_projects           = true
  has_wiki               = var.type == "core" ? true : false
  has_downloads          = true
  is_template            = var.type == "template" ? true : false
  allow_merge_commit     = true
  allow_squash_merge     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true
  auto_init              = false
  archived               = false
  archive_on_destroy     = true
  vulnerability_alerts   = true #var.type == "template" ? false : true # not supported by github app permission for templates
  topics                 = concat(local.topics, var.topics)

  security_and_analysis {
    dynamic "advanced_security" {
      for_each = var.visibility == "public" ? [] : [1]
      content {
        status = "enabled"
      }
    }
    secret_scanning {
      status = "enabled"
    }
    secret_scanning_push_protection {
      status = "enabled"
    }
  }


  #  var.type can be core, module or template 
  #  - if core, clone var.name from github_org
  #  - if template, configure repo template and clone var.name from github_org
  #  - if module , clone template-cloudv2-platform-terraform-module from github_org
  #  github_org defaults to current org

  template {
    owner      = var.github_org
    repository = var.name
    #repository = var.type == "module" ? "cloudv2-platform-terraform-module-template" : var.github_org == null ? var.name : "template-repository"
    #repository = var.github_org == null ? "asdf" : "qwer"
  }

  #  #
  # when creating a github repository
  #   is_template : configures repository as template
  #   template : use a template as base for repository

  # The `pages.source` block doesn't support dynamic blocks in GitHub provider version 4.3.2,
  # so we ignore the changes so it doesn't try to revert repositories that have manually set
  # their pages configuration.
  lifecycle {
    ignore_changes = [template, pages]
  }
}

resource "github_branch_protection" "default" {
  repository_id  = github_repository.default.id
  pattern        = "main"
  enforce_admins = false # allow admins to override PR
  #checkov:skip=CKV_GIT_6:"Following discussions with other teams we will not be enforcing signed commits currently"
  require_signed_commits = false # true prevents terraform from provisioning

  required_status_checks {
    strict   = false
    contexts = var.required_checks
  }

  #checkov:skip=CKV_GIT_5: "GitHub pull requests should require at least 2 approvals" however we only require 1
  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }
}

resource "github_repository_tag_protection" "default" {
  repository = github_repository.default.id
  pattern    = "*"
}

## Secrets
#data "github_actions_public_key" "default" {
#  repository = github_repository.default.id
#}

#resource "github_actions_secret" "default" {
#  #checkov:skip=CKV_GIT_4:Although secrets are provided in plaintext, they are encrypted at rest
#  for_each        = var.secrets
#  repository      = github_repository.default.id
#  secret_name     = each.key
#  plaintext_value = each.value
#}
























































