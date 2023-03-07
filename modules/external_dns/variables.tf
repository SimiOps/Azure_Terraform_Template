variable "external_dns_name"{
    description = "Nome do nosso External Dns"
}

variable "external_dns_repository"{
    description = "Repositorio do nosso External Dns"
}

variable "external_dns_chart"{
    description = "Chart do nosso External Dns"
}

variable "external_dns_namespace"{
    description = "Namespace do nosso External Dns"
}

variable "external_dns_version"{
    description = "Versão do nosso External Dns"
}

#VARIAVEL IMPORTADA PARA O MODULO
variable "kubeconfig_tf"{
    description = "Kubeconfig do nosso cluster kubernetes"
}