locals {
  enable_branch_protection = "${var.enable_branch_protection ? 1 : 0}"
  update_circleci          = "${var.update_circleci ? 1 : 0}"
}
