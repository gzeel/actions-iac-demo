provider "github" {
  owner = var.repo_owner
}

# Label dat bij de eerste run wordt aangemaakt (idempotent)
resource "github_issue_label" "deployed" {
  repository  = var.repo_name
  name        = "deployed"
  color       = "0e8a16"
  description = "Created by Terraform"
}

# Een duidelijke, tastbare actie: een issue aanmaken bij succesvolle pipeline
resource "github_issue" "deployment_success" {
  repository = var.repo_name
  title      = "✅ Deployment successful"
  body       = "Created by Terraform at ${timestamp()}"
  labels     = [github_issue_label.deployed.name]
}