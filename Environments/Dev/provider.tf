terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    subscription_id      = "c4392c89-177c-49fd-abc6-1b1d293e65b7"
    resource_group_name  = "dev-rg-back"
    storage_account_name = "devstgback1"
    container_name       = "tfstate"
    key                  = "devinfra.tfstate"
  }

}


provider "azurerm" {
  features {}
  subscription_id = "c4392c89-177c-49fd-abc6-1b1d293e65b7"

}