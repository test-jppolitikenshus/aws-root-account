#data "github_actions_environment_variables" "asdf" {
#  #name        = basename(path.cwd)
#  #name        = basename $(git rev-parse --show-toplevel)
#  name        = path.cwd
#  environment = "test"
#}

#data "external" "asdf" {
#  program = [
#    #"gh variable list -e test |grep -E "^AWS_ACCOUNT\t"|awk '{print $2}'"
#    "uname - a"
#  ]
#  result {
#
#  }
#}

#output "asdfasfd" {
#  description = "asdfasdfasdasdasdasdasdasdasdasdasdasfasasdfddfffffffffasdasfasdasdasdasdasdasdasdasdasdfffffffffdf"
#  value       = data.external.asdf.program
#}

























































































