variable "ingress_name"{
    description = "Nome do nosso ingress nginx"
}

variable "ingress_namespace"{
    description = "Namespace do nosso ingress nginx no cluster"
}

variable "ingress_helm_repository"{
    description = "Repositorio do nosso ingress nginx no cluster"
}

variable "ingress_helm_chart"{
    description = "Chart do nosso ingress nginx no cluster"
}
# VARIAVEIS IMPORTADAS DO NOSSO CLUSTER
variable "public_ip_aks"{
    description = "Ip publico importado do modulo do nosso Aks"
}

variable "kubeconfig_tf"{
    description = "Kubeconfig do nosso cluster kubernetes"
}