terraform {
  # Pin the Terraform CLI so the repo behaves the same on your laptop and in CI.
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"

      # TODO(you): confirm the current major on the registry and pin deliberately.
      # Why: an unpinned provider can pull a breaking release between runs.
      # Research: https://registry.terraform.io/providers/hashicorp/aws/latest
      version = "~> 5.0"
    }
  }

  # TODO(you): Remote state — do this BEFORE your first apply.
  #
  # Why: local state lives only on this laptop. Lose the laptop, lose the map
  # of what Terraform created. Two concurrent runs can corrupt it. Remote state
  # also gives you locking and a shared source of truth.
  #
  # Research:
  #   - S3 backend: https://developer.hashicorp.com/terraform/language/backend/s3
  #   - Locking: use_lockfile (S3-native, Terraform >= 1.10) or DynamoDB
  #   - Why the bucket should live in a dedicated/security account, not a workload
  #
  # Steps once the bucket exists:
  #   1. Uncomment and fill in the block below.
  #   2. Run `terraform init -migrate-state`.
  #   3. Confirm where the state actually went before applying anything.
  #
  # backend "s3" {
  #   bucket       = "<state-bucket-name>"
  #   key          = "landing-zone/terraform.tfstate"
  #   region       = "ap-southeast-1"
  #   encrypt      = true
  #   use_lockfile = true
  # }
}
