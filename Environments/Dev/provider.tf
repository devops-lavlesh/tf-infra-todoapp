terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    subscription_id      = "c2a94f1c-4045-4aa8-afec-ee2dbd47e8a4"
    resource_group_name  = "dev-rg-back"
    storage_account_name = "devstgback3"
    container_name       = "tfstate"
    key                  = "devinfra.tfstate"
  }

}


provider "azurerm" {
  features {}
  subscription_id = "c2a94f1c-4045-4aa8-afec-ee2dbd47e8a4"

}