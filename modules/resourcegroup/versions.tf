terraform {
  required_version = ">= 1.13.5, < 2.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0"
    }
  }
}