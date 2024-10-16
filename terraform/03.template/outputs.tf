data "aws_caller_identity" "current" {}

output "account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "AWS Account ID"
}

output "caller_arn" {
  value       = data.aws_caller_identity.current.arn
  description = "which arn is calling"
}

output "caller_user" {
  value       = data.aws_caller_identity.current.user_id
  description = "which user is calling"
}
