variable "azure_project_id" {
  description = "Id do nosso projeto gerado pelo terraform no Azure Devops"
}

variable "aks_service_endpoint_name" {
  description = "Nome para a criação da service connection do AKS"
}

# variable "arm_service_endpoint_name" {
#   description = "Nome para a criação da service connection do ARM"
# }

variable "cluster_context" {
  description = "Contexto da kubeconfig do nosso cluster kubernetes"
}

variable "aks_apiserver" {
  description = "Api Endpoint do nosso cluster kubernetes"
}

variable "kubeconfig_raw_tf"{
    description = "Kubeconfig Raw do nosso cluster"
}

# variable "service_principal_id"{
#     description = "ID da service principal"
# }

# variable "service_principal_key"{
#     description = "Key da service principal"
# }