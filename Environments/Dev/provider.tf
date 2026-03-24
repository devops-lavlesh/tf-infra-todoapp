terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    subscription_id      = "22f9be81-a778-4964-9d20-f5a30e08fef1"
    resource_group_name  = "dev-rg-back"
    storage_account_name = "devstgback2"
    container_name       = "tfstate"
    key                  = "devinfra.tfstate"
  }

}


provider "azurerm" {
  features {}
  subscription_id = "22f9be81-a778-4964-9d20-f5a30e08fef1"

}