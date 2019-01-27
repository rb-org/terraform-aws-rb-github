output "ssh_clone_url" {
  value = "${github_repository.main.*.ssh_clone_url}"
}

output "ssh_clone_url_no_cci" {
  value = "${github_repository.main_no_cci.*.ssh_clone_url}"
}
