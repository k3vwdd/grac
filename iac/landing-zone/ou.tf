# ---------------------------------------------------------------------------
# Organizational Units
# ---------------------------------------------------------------------------
# Design rule: an OU groups accounts that share the SAME controls, so an SCP
# attached to the OU applies to every account under it. Do NOT create one OU
# per account — that gives you no inheritance and forces you to attach every
# policy N times.
#
# Target shape (adjust names, but keep the grouping):
#
#   Root
#   ├── Security     <- log archive / security tooling account(s)
#   └── Workloads    <- dev + prod accounts (same baseline guardrails)
#
# If dev and prod genuinely need different guardrails later, split Workloads
# into Dev and Prod. Don't split until you can name the control that differs.
#
# TODO(you): Implement ONE OU first. Read the plan output line by line, apply,
# then add the second. Do not add accounts in the same change.
#
# resource "aws_organizations_organizational_unit" "security" {
#   name      = "Security"
#   parent_id = local.root_id
# }
#
# resource "aws_organizations_organizational_unit" "workloads" {
#   name      = "Workloads"
#   parent_id = local.root_id
# }

# ---------------------------------------------------------------------------
# Later phases (write these as separate files when you get here)
# ---------------------------------------------------------------------------
# - SCPs: attach to an OU, test on a throwaway account first.
#   Remember: SCPs do NOT apply to the management account.
# - IAM Identity Center: org-level, enabled in the management account.
# - Org CloudTrail: trail in management -> bucket in the security account.
#   The cross-account bucket policy is the hard part.
