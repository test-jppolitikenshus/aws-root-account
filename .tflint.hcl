plugin "terraform" {
    enabled = true
    preset  = "all"
}
plugin "aws" {
    enabled = true
    version = "0.33.0"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}
plugin "azurerm" {
    enabled = true
    version = "0.21.0"
    source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}
