terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.76.0"
    }
  }
  backend "azurerm" {
    subscription_id      = "d45d303f-5dbd-4fbf-9adb-39c652a0547d"
    resource_group_name  = "dev-rg-back"
    storage_account_name = "devstgbacke"
    container_name       = "tfstate"
    key                  = "devinfra.tfstate"
  }

}


provider "azurerm" {
  features {}
  subscription_id = "d45d303f-5dbd-4fbf-9adb-39c652a0547d"

}