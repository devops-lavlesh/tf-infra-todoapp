# App Service Plan
resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan
  location            = var.location
  resource_group_name = var.rg_name

  os_type  = "Linux"
  sku_name = "B1"
}

# Web App
resource "azurerm_linux_web_app" "webapp" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      node_version = "18-lts"
    }
  }

  app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "18-lts"
    "DB_CONNECTION" = "Server=tcp:${var.sql_server_name}.database.windows.net;Database=${var.sql_database_name};User ID=${var.sql_admin_username};Password=${var.sql_admin_password};"
  }

  tags = var.tags
}