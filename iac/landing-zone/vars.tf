variable "region" {
  description = "AWS region for the landing zone. Keep one region until you have a reason to add more."
  type        = string
  default     = "ap-southeast-1"
}

# TODO(you): Add the inputs your OU/account design needs — with types,
# descriptions, and validation. Suggested shape, not a solution:
#
# variable "account_emails" {
#   description = "Unique, deliverable email per member account (use + aliases)."
#   type        = map(string)
#
#   # Why a map: account creation is the same operation repeated. `for_each`
#   # over a map keeps one definition instead of copy-pasting resources.
#   #
#   # Why no default: account emails are environment-specific, not code.
#   #
#   # Research: AWS requires a globally unique email per account and uses it
#   # for root recovery. `example.com` is reserved and undeliverable — never
#   # use it, or you will be locked out of an account you cannot recover.
# }
#
# Research: variable validation blocks, and why `sensitive = true` exists.
