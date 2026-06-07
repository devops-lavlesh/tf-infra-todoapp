terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.76.0"
    }
  }
  backend "azurerm" {
    subscription_id      = "582e7b86-d28f-4458-b727-2305c8849192"
    resource_group_name  = "dev-rg-back"
    storage_account_name = "devstgback6"
    container_name       = "tfstate"
    key                  = "devinfra.tfstate"
  }

}


provider "azurerm" {
  features {}
  subscription_id = "582e7b86-d28f-4458-b727-2305c8849192"

}