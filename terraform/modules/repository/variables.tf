variable "name" {
  type        = string
  description = "Repository name"
}

variable "description" {
  type        = string
  description = "Repository description"
}

variable "homepage_url" {
  type        = string
  description = "Repository homepage URL"
  default     = ""
}

#variable "secrets" {
#  type        = map(any)
#  description = "key:value map for GitHub actions secrets"
#  default     = {}
#}

variable "topics" {
  type        = list(string)
  description = "Repository topics, in addition to 'cloudv2-platform', 'terraform-module'"
}

variable "type" {
  type        = string
  description = "Type of repository: `core`, `module`, `template`. Defaults to `core`"
  default     = "core"
}

variable "visibility" {
  type        = string
  description = "Visibility type: `public`, `internal`, `private`"
  default     = "public"
}

variable "required_checks" {
  type        = list(string)
  description = "List of required checks"
  default     = []
}

variable "github_org" {
  type        = string
  description = "GitHub organization name"
  default     = "test-jppolitikenshus"
}

variable "template_name" {
  type        = string
  description = "name of the template (used to manage dependency)"
}
