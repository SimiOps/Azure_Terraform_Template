### CRIA PROJETO AZURE DEVOPS 
resource "azuredevops_project" "terraform_ado_project" {
  name       = var.project_name
  description        = var.project_description
  visibility         = var.project_visibility
  version_control    = var.project_version_control
  work_item_template = var.work_item_template


### ATIVA OU DESATIVA FEATURES

  features = {
      "boards" = "enabled"
      "repositories" = "enabled"
      "pipelines" = "enabled"
      "testplans" = "enabled"
      "artifacts" = "enabled"
  }
}

resource "azuredevops_project_pipeline_settings" "azurepipeperms" {
  project_id = azuredevops_project.terraform_ado_project.id

  enforce_job_scope = true
  enforce_referenced_repo_scoped_token = false
  enforce_settable_var = true
  publish_pipeline_metadata = false
  status_badges_are_private = true
}



