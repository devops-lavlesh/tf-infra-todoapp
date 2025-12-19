terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    subscription_id      = "2a238ca4-a95b-43d2-846c-1618b53c6203"
    resource_group_name  = "dev-rg-back"
    storage_account_name = "devstgback2"
    container_name       = "tfstate"
    key                  = "devinfra.tfstate"
  }

}


provider "azurerm" {
  features {}
  subscription_id = "2a238ca4-a95b-43d2-846c-1618b53c6203"

}