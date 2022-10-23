data "aws_caller_identity" "this" {}

resource "aws_iam_account_alias" "this" {
    account_alias = var.name
}