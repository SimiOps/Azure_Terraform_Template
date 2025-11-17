terraform {
  required_version = ">= 1.13.5, < 2.0"

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 1.0.0, < 2.0"
    }
  }
}