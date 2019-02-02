variable "repo_name" {}

variable "repo_description" {}

variable "private_repo" {
  default = true
}

variable "has_issues" {
  default = true
}

variable "has_wiki" {
  default = true
}

variable "allow_merge_commit" {
  default = true
}

variable "allow_squash_merge" {
  default = true
}

variable "allow_rebase_merge" {
  default = true
}

variable "auto_init" {
  default = true
}

variable "gitignore_template" {
  default = "Terraform"
}

variable "license_template" {
  default = "mit"
}

variable "teams" {
  type = "list"
}

variable "team_count" {}

variable "enforce_admins" {
  default = true
}

variable "strict_status_checks" {
  default = true
}

variable "contexts" {
  type    = "list"
  default = [""]
}

variable "dismiss_stale_reviews" {
  default = true
}

variable "dismissal_users" {
  type    = "list"
  default = [""]
}

variable "dismissal_teams" {
  type    = "list"
  default = [""]
}

variable "enable_branch_protection" {
  default = false
}

variable "circleci_token" {
  default = ""
}

variable "update_circleci" {
  default = false
}

variable "github_org" {
  default = ""
}

variable "vcs" {
  default = "github"
}

variable "github_token" {}
