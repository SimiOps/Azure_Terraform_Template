terraform {
  required_version = ">= 1.13.5, < 2.0"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.12.1, < 3.0"
    }
  }
}

