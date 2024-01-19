locals {

  # github organisation
  #  access to github organisation is GitHub CLI (gh auth login)
  github_org = "test-jppolitikenshus"

  # aws account id
  aws_root_account = "474892472306" #aws-test-master:474892472306)

  # authenticate to above account, maybe something like:
  #  aws-sso -STest-JPPol exec -- bash --rcfile ~/.bash_profile
  #  terraform init
  #  terraform plan

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
  ]

  # Security engineers performing reviews on the platform or member accounts
  security = [
  ]

  # Members of the long-term-storage account team to acccess that account
  long-term-storage = [
  ]

  # All members
  all_members = concat(local.members, local.engineers)

  # Everyone
  everyone = concat(local.maintainers, local.all_members)

  # Testing secret scanning
  this_is_a_secret = "sagt5e4weasrvdthe"
}

