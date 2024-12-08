# Repositories
#module "aws_root_account" {
#  source      = "./../modules/bootstrap-repository"
#  name        = "aws-root-account"
#  type        = "core"
#  description = "Terraform for the aws-root-account of jppol"
#  topics = [
#    "aws",
#    "security",
#    "organisation",
#    "github"
#  ]
#  github_org = "commercial-tech"
#}

#module "template_repository" {
#  source      = "./../modules/bootstrap-repository"
#  name        = "template-repository"
#  type        = "template"
#  description = "Github template repository with organisation defaults"
#  topics = [
#    "aws",
#    "terraform"
#  ]
#  github_org = "commercial-tech"
#}

#module "template_cloud_platform_terraform_module" {
#  source      = "./../modules/bootstrap-repository"
#  name        = "template-cloud-platform-terraform-module"
#  type        = "template"
#  description = "Template repository for creating Terraform modules for use with the Cloud Platform"
#  topics = [
#    "aws",
#    "terraform",
#    "module"
#  ]
#  github_org = "commercial-tech"
#}

#output "bla" {
#  value = module.template-cloud-platform-terraform-module.repository.name
#}

#module "cloud_platform" {
#  source       = "./../modules/repository"
#  name         = "cloud-platform"
#  type         = "core"
#  description  = "A place for the idp Platform core"
#  homepage_url = "https://user-guide.idp-platform.jppol.dk"
#  topics = [
#    "aws",
#    "architecture-decisions",
#    "documentation"
#  ]
#  template_name = module.template_repository.repository.name
#}

#module "cloud_platform_terraform_module_baseline" {
#  source      = "./../modules/repository"
#  name        = "cloud-platform-terraform-baseline"
#  type        = "module"
#  description = "Module for enabling and configuring common baseline services such as SecurityHub"
#  topics = [
#    "aws",
#    "aws-baseline",
#    "security"
#  ]
#  template_name = module.template_cloud_platform_terraform_module.repository.name
#}
