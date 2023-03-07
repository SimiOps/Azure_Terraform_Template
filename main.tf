module "resource_group" {
  source = "./modules/resourcegroup"
 
  rg_name = "infraestrutura-tf"
  rg_region = "brazilsouth"
}

module "acr_registry" {
  source = "./modules/acr"
  
  acr_name = "acr-name"
  acr_sku_tier = "Standard"

  resource_group_tf_name = module.resource_group.resource_group_tf_name
  resource_group_tf_region = module.resource_group.resource_group_tf_region
}

module "aks_cluster" {
  source = "./modules/aks"

  # VARIAVEIS DO MODULO
  aks_ip = "ip-aks-tf"
  ip_sku_tier = "Standard"
  aks_name = "aks-tf"
  sku_aks= "Free"
  aks_version = 1.23
  dns_prefix = "aks-tf"
  nodepool_apps_name = "aplicacoes"
  nodepool_vm_size = "Standard_B2s"
  # Resource Group Module variables
  resource_group_tf_name = module.resource_group.resource_group_tf_name
  resource_group_tf_region = module.resource_group.resource_group_tf_region
  # ACR Module variables
  acr_registry_id = module.acr_registry.cluster_tf_id

}

module "nginx_ingress" {
  source = "./modules/nginx_ingress"
 
  ingress_name = "ingress-nginx"
  ingress_namespace = "ingress-nginx"
  ingress_helm_repository = "https://kubernetes.github.io/ingress-nginx"
  ingress_helm_chart = "ingress-nginx"

  public_ip_aks = module.aks_cluster.public_ip_aks
  kubeconfig_tf = module.aks_cluster.kubeconfig_tf
}

module "external_dns" {
  source = "./modules/external_dns"
 
  external_dns_name = "external-dns"
  external_dns_repository = "https://charts.bitnami.com/bitnami"
  external_dns_chart = "external-dns"
  external_dns_namespace = "kube-addons"
  external_dns_version = "6.13.2"

  kubeconfig_tf = module.aks_cluster.kubeconfig_tf
}

module "azuredevops" {
  source = "./modules/azuredevops"
 
  project_name = "AzureProject"
  project_description = "Projeto gerado via codigo terraform"
  project_visibility = "private"
  project_version_control = "Git"
  work_item_template = "Agile"

}

module "serviceconnections" {
  source = "./modules/serviceconnections"
 
  aks_service_endpoint_name = "aks_tf_conn"
  cluster_context = "aks-tf"

  azure_project_id = module.azuredevops.azure_project_id
  aks_apiserver = module.aks_cluster.aks_apiserver
  kubeconfig_raw_tf = module.aks_cluster.kubeconfig_raw_tf

}


