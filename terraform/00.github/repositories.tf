# Repositories
module "aws_root_account" {
  source      = "./../modules/bootstrap-repository"
  name        = "aws-root-account"
  type        = "core"
  description = "Terraform for the aws-root-account of jppol"
  topics = [
    "aws",
    "security",
    "organisation",
    "github"
  ]
  github_org = "commercial-tech"
}

module "template_repository" {
  source      = "./../modules/bootstrap-repository"
  name        = "template-repository"
  type        = "template"
  description = "Github template repository with organisation defaults"
  topics = [
    "aws",
    "terraform"
  ]
  github_org = "commercial-tech"
}

module "template_cloudv2_platform_terraform_module" {
  source      = "./../modules/bootstrap-repository"
  name        = "template-cloudv2-platform-terraform-module"
  type        = "template"
  description = "Template repository for creating Terraform modules for use with the Cloudv2 Platform"
  topics = [
    "aws",
    "terraform",
    "module"
  ]
  github_org = "commercial-tech"
}

#output "bla" {
#  value = module.template-cloudv2-platform-terraform-module.repository.name
#}

module "cloudv2_platform" {
  source       = "./../modules/repository"
  name         = "cloudv2-platform"
  type         = "core"
  description  = "A place for the Cloudv2 Platform core"
  homepage_url = "https://user-guide.cloudv2-platform.jppol.dk"
  topics = [
    "aws",
    "architecture-decisions",
    "documentation"
  ]
  template_name = module.template_repository.repository.name
}

module "cloudv2_platform_terraform_module_baseline" {
  source      = "./../modules/repository"
  name        = "cloudv2-platform-terraform-baseline"
  type        = "module"
  description = "Module for enabling and configuring common baseline services such as SecurityHub"
  topics = [
    "aws",
    "aws-baseline",
    "security"
  ]
  template_name = module.template_cloudv2_platform_terraform_module.repository.name
}
