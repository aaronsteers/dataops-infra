workflow "Terraform" {
  resolves = "terraform-plan"
  on = "pull_request"
}

action "filter-to-pr-open-synced" {
  uses = "actions/bin/filter@master"
  args = "action 'opened|synchronize'"
}

action "terraform-fmt" {
  uses = "hashicorp/terraform-github-actions/fmt@v0.2.0"
  needs = "filter-to-pr-open-synced"
  secrets = ["GITHUB_TOKEN"]
  env = {
    TF_ACTION_WORKING_DIR = "modules/aws/free-tier"
  }
}

action "terraform-init" {
  uses = "hashicorp/terraform-github-actions/init@v0.2.0"
  needs = "filter-to-pr-open-synced"
  secrets = ["GITHUB_TOKEN"]
  env = {
    TF_ACTION_WORKING_DIR = "modules/aws/free-tier"
  }
}

action "terraform-validate" {
  uses = "hashicorp/terraform-github-actions/validate@v0.2.0"
  needs = "terraform-init"
  secrets = [
    "GITHUB_TOKEN",
    "AWS_ACCESS_KEY_ID",
    "AWS_SECRET_ACCESS_KEY",
  ]
  env = {
    TF_ACTION_WORKING_DIR = "modules/aws/free-tier"
    TF_VAR_AWS_ACCESS_KEY_ID = "$AWS_ACCESS_KEY_ID"
    TF_VAR_AWS_SECRET_ACCESS_KEY = "$AWS_SECRET_ACCESS_KEY"
  }
}

action "terraform-plan" {
  uses = "hashicorp/terraform-github-actions/plan@v0.2.0"
  needs = "terraform-validate"
  secrets = [
    "GITHUB_TOKEN",
    "AWS_ACCESS_KEY_ID",
    "AWS_SECRET_ACCESS_KEY",
  ]
  env = {
    TF_ACTION_WORKING_DIR = "modules/aws/free-tier"
    TF_VAR_AWS_ACCESS_KEY_ID = "$AWS_ACCESS_KEY_ID"
    TF_VAR_AWS_SECRET_ACCESS_KEY = "$AWS_SECRET_ACCESS_KEY"
    # If you're using Terraform workspaces, set this to the workspace name.
    TF_ACTION_WORKSPACE = "default"
  }
}
