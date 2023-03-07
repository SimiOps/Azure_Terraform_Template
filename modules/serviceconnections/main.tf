# data "azurerm_client_config" "current" {}

 resource "azuredevops_serviceendpoint_kubernetes" "kubernetes_conn" {
   project_id            = var.azure_project_id
   service_endpoint_name = var.aks_service_endpoint_name #"aks_tf_conn"
   apiserver_url         = "https://${var.aks_apiserver}"
   authorization_type    = "Kubeconfig"

   kubeconfig {
    kube_config            = var.kubeconfig_raw_tf
    accept_untrusted_certs = true
    cluster_context        = var.cluster_context #"obvious-tf"
  }
  lifecycle {
    ignore_changes = [
      kubeconfig[0].cluster_context
    ]
  }
 }




