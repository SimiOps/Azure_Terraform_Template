# CRIAÇÃO DO IP PUBLICO PARA O AKS
resource "azurerm_public_ip" "ip-aks-tf" {
  name                = var.aks_ip
  resource_group_name = "${var.resource_group_tf_name}-aks"
  location            = var.resource_group_tf_region
  allocation_method   = var.allocation_method_tf
  sku                 = var.ip_sku_tier
  depends_on = [
    azurerm_kubernetes_cluster.aks-tf
  ]  
}

# DEPLOY DO CLUSTER AKS 
resource "azurerm_kubernetes_cluster" "aks-tf" {
  name                = var.aks_name
  resource_group_name = var.resource_group_tf_name
  location            = var.resource_group_tf_region
  node_resource_group = "${var.resource_group_tf_name}-aks"
  sku_tier            = var.sku_aks
  kubernetes_version  = var.aks_version

  dns_prefix = var.dns_prefix

#  NODEPOOL PARA SISTEMA SEM AUTO SCALE  

  default_node_pool {
    name                = "sistema"
    vm_size             = "Standard_B2s"
    zones               = ["1", "2", "3"]
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 1
    os_disk_type        = "Managed"
    os_disk_size_gb     = 32
    type                = "VirtualMachineScaleSets"
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    load_balancer_sku  = "standard"
  }


  identity {
    type = "SystemAssigned"
  }
  
    
  lifecycle {
    ignore_changes = [
      network_profile[0].nat_gateway_profile
    ]
  }
}

#  NODEPOOL PARA APLICACOES EM MODO USUARIO COM ESCALABILIDADE

resource "azurerm_kubernetes_cluster_node_pool" "aplicacoes" {
  name                  = var.nodepool_apps_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks-tf.id
  vm_size               = var.nodepool_vm_size
  enable_auto_scaling = true
  min_count           = 1
  max_count           = 2
}

resource "azurerm_role_assignment" "ra" {
  principal_id                     =  azurerm_kubernetes_cluster.aks-tf.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_registry_id
  skip_service_principal_aad_check = true
  depends_on = [
    azurerm_kubernetes_cluster.aks-tf
  ] 
}


