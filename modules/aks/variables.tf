variable "aks_ip" {
  description = "Ip publico do Aks"
  type    = string
}

variable "ip_sku_tier" {
  description = "Tier do SKU do Ip Publico"
  type    = string
}

variable "aks_name" {
  description = "Nome do nosso cluster Kubernetes"
  type    = string
}

variable "sku_aks" {
  description = "Tier do SKU do Aks"
  type    = string
}

variable "aks_version" {
  description = "Versao do nosso Kubernetes"
}

variable "dns_prefix"{
    description = "Prefixo dns do nosso cluster"
}

variable "nodepool_apps_name"{
    description = "Nome da NodePool de aplicacoes do cluster"
}

variable "nodepool_vm_size"{
    description = "Shape da nossa máquina de aplicacoes"
}

variable "allocation_method_tf"{
    description = "Allocation Method"
    default = "Static"
}

# RECURSOS IMPORTADOS DO RESOURCE GROUP MODULE
variable "resource_group_tf_name" {
    description = "Grupo de recursos principal do nosso terraform"
}

variable "resource_group_tf_region" {
    description = "Regiao do grupo de recursos principal do nosso terraform"
}

# RECURSOS IMPORTADOS DO ACR  MODULE
variable "acr_registry_id" {
    description = "Id do nosso Registry gerado no Azure"
}









































