terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.72.0"
    }
  }
  backend "azurerm" {
    subscription_id      = "fc890557-6a78-4e91-9eac-5aff85b5fc09"
    resource_group_name  = "dev-rg-back"
    storage_account_name = "devstgback4"
    container_name       = "tfstate"
    key                  = "devinfra.tfstate"
  }

}


provider "azurerm" {
  features {}
  subscription_id = "fc890557-6a78-4e91-9eac-5aff85b5fc09"

}