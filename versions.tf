terraform {
  required_version = ">= 1.13.5, < 2.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0"
    }

    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 1.0.0, < 2.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.12.1, < 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

