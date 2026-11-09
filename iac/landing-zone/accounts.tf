# ---------------------------------------------------------------------------
# Member accounts
# ---------------------------------------------------------------------------
# TODO(you): Add ONE account first (security). Not three. Then learn how to
# assume into it before you automate the rest.
#
# Research these before writing the resource:
#   - `email`: globally unique and deliverable; root recovery depends on it.
#   - `role_name`: default is OrganizationAccountAccessRole. If you rename it,
#     you must use that name when assuming into the account.
#   - `close_on_deletion`: leave false. Then `terraform destroy` will NOT close
#     accounts. Know exactly what destroy does before enabling it.
#   - Account creation is slow and can partially fail. Know the recovery path.
#
# resource "aws_organizations_account" "security" {
#   name      = "security"
#   email     = var.account_emails["security"]
#   parent_id = aws_organizations_organizational_unit.security.id
#   role_name = "OrganizationAccountAccessRole"
#
#   # Keep this false. Close accounts deliberately, not via destroy.
#   close_on_deletion = false
# }

# ---------------------------------------------------------------------------
# Checkpoint before you apply
# ---------------------------------------------------------------------------
# If you ran `terraform destroy` right now, what would be deleted?
# What could not be undone? Write the answer down before you apply.
