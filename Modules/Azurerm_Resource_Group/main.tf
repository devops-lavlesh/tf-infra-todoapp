resource "azurerm_resource_group" "rg_names" {
  name     = var.rg_name
  location = var.location

  tags = var.tags
  
}
