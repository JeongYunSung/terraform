output "id" {
  description = "account id"
  value       = data.aws_caller_identity.this.account_id
}

output "name" {
  description = "account alias"
  value       = aws_iam_account_alias.this.account_alias
}
