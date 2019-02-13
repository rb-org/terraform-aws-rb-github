resource "github_repository" "main" {
  count       = "${local.update_circleci}"
  name        = "${var.repo_name}"
  description = "${var.repo_description}"

  private = "${var.private_repo}"

  # Settings
  has_issues         = "${var.has_issues}"
  has_wiki           = "${var.has_wiki}"
  allow_merge_commit = "${var.allow_merge_commit}"
  allow_squash_merge = "${var.allow_squash_merge}"
  allow_rebase_merge = "${var.allow_rebase_merge}"
  auto_init          = "${var.auto_init}"
  gitignore_template = "${var.gitignore_template}"
  license_template   = "${var.license_template}"

  provisioner "local-exec" {
    on_failure = "continue"
    command    = "echo ${data.template_file.circleci_api_sh.rendered} >> ./circleci_api.sh && chmod +x ./circleci_api.sh && ./circleci_api.sh"
  }
}

data "template_file" "circleci_api_sh" {
  count    = "${local.update_circleci}"
  template = "${file("${path.module}/files/circleci_api.sh.tpl")}"

  vars {
    cci_token    = "${var.circleci_token}"
    vcs          = "${var.vcs}"
    github_org   = "${var.github_org}"
    git_repo     = "${var.repo_name}"
    github_token = "${var.github_token}"
  }
}

resource "github_team_repository" "main" {
  count      = "${var.team_count * local.update_circleci}"
  team_id    = "${lookup(var.teams[count.index], "team")}"
  repository = "${github_repository.main.name}"
  permission = "${lookup(var.teams[count.index], "perms")}"
}

resource "github_branch_protection" "main" {
  count          = "${local.enable_branch_protection * local.update_circleci > 0 ? 1 : 0}"
  repository     = "${github_repository.main.name}"
  branch         = "master"
  enforce_admins = "${var.enforce_admins}"

  required_status_checks {
    strict   = "${var.strict_status_checks}"
    contexts = ["${var.contexts}"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = "${var.dismiss_stale_reviews}"
    dismissal_users       = ["${var.dismissal_users}"]
    dismissal_teams       = ["${var.dismissal_teams}"]
  }
}
