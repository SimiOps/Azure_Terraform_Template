variable "acr_name" {
  description = "Nome do nosso Azure Registry"
}

variable "acr_sku_tier" {
  description = "Tier do nosso Azure Registry"
}

# VARIAVEIS IMPORTADAS DO RECURSO RESOURCE_GROUP
variable "resource_group_tf_name" {
    description = "Grupo de recursos principal do nosso terraform"
}

variable "resource_group_tf_region" {
    description = "Regiao do grupo de recursos principal do nosso terraform"
}