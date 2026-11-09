# Authentication is intentionally NOT hardcoded here.
#
# Why: the AWS provider uses the standard credential chain
# (env vars -> AWS_PROFILE / SSO -> shared config -> instance role).
# Hardcoding a profile or credentials file in the repo:
#   - leaks personal/account details into git history
#   - breaks once humans move to IAM Identity Center (SSO)
#   - encourages long-lived access keys, which this project exists to prevent
#
# TODO(you): Research the credential chain and the SSO login flow:
#   aws sso login --profile <name>
#   export AWS_PROFILE=<name>
#   terraform plan
#
# Never use root access keys. If you currently have any, deactivate them now.
provider "aws" {
  region = var.region

  # TODO(you): Add default_tags so every resource is attributable.
  # Why: tag-based cost allocation and ownership are how you find things later.
  #
  # default_tags {
  #   tags = {
  #     Project   = "guardrails-as-code"
  #     ManagedBy = "terraform"
  #   }
  # }
}

# The management account is already an AWS Organization with one member
# (itself). This data source READS that existing org; it does not create one.
#
# TODO(you): Decide and document (docs/decisions/):
#   Is enabling the org once by hand the safer bootstrap, or should
#   `aws_organizations_organization` be a managed resource? Write down why.
data "aws_organizations_organization" "this" {}

locals {
  root_id = data.aws_organizations_organization.this.roots[0].id
}
