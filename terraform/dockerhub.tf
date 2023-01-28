resource "dockerhub_repository" "dockerhub_repo" {
  name             = var.service
  namespace        = var.org_name
  description      = "${var.service_domain} container repo"
  full_description = "${var.service_domain} container repo"
}
