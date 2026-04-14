locals {
  common_tags = {
    ManagedBy   = "Terraform"
    owner       = "shiro"
    project     = "Todo-App"
    environment = "Dev"
  }
}
module "resource_group" {
  source   = "../../Modules/Azurerm_Resource_Group"
  rg_name  = "dev-todoapp-rglav"
  location = "West Europe"
  tags     = local.common_tags
}

# module "storage_account" {
#   depends_on = [module.resource_group]

#   source                   = "../../Modules/Azurerm_Storage_Acnt"
#   stg_name                 = "devtodoappstglav"
#   rg_name                  = "dev-todoapp-rglav"
#   location                 = "West Europe"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   tags                     = local.common_tags
# }
module "container_registry" {
  depends_on = [module.resource_group]

  source   = "../../Modules/Azurerm_Container_Registry"
  acr_name = "lucktodoappacr2025"
  rg_name  = "dev-todoapp-rglav"
  location = "West Europe"
  tags     = local.common_tags
}
module "kubernetes_cluster" {
  depends_on = [module.resource_group]

  source       = "../../Modules/Azurerm_K8s_Cluster"
  cluster_name = "dev-todoapp-aks-lav"
  rg_name      = "dev-todoapp-rglav"
  location     = "West Europe"
  dns_prefix   = "dev-todoapp-aks-lav"
  node_count   = 1
  vm_size      = "Standard_DS2_v2"
  tags         = local.common_tags
}

module "sql_server" {
  depends_on = [module.resource_group]

  source             = "../../Modules/Azurerm_SQL_Server"
  sql_server_name    = "devtodoappsqlsvrlav"
  rg_name            = "dev-todoapp-rglav"
  location           = "West Europe"
  sql_admin_username = "sqladminlav"
  sql_admin_password = "Devopslav@1001"
  tags               = local.common_tags
}
module "sql_database" {
  depends_on = [module.sql_server]

  source            = "../../Modules/Azurerm_SQL_Database"
  sql_database_name = "devtodoappdblav"
  sql_server_id     = module.sql_server.azurerm_mssql_server_id

  tags = local.common_tags
}

# module "ui_webapp" {
#   depends_on       = [module.resource_group]
#   source           = "../../Modules/Azurerm_Webapp"
#   runtime_stack    = "node"
#   enable_db        = false
#   app_name         = "dev-todoapp-ui-web-lav"
#   app_service_plan = "dev-todoapp-ui-asp-lav"
#   rg_name          = "dev-todoapp-rglav"
#   location         = "West Europe"

#   tags = local.common_tags
# }

# module "backned_webapp" {
#   depends_on         = [module.sql_database]
#   source             = "../../Modules/Azurerm_Webapp"
#   runtime_stack      = "python"
#   enable_db          = true
#   app_name           = "dev-todoapp-backend-web-lav"
#   app_service_plan   = "dev-todoapp-backend-asp-lav"
#   rg_name            = "dev-todoapp-rglav"
#   location           = "West Europe"
#   sql_server_name    = "devtodoappsqlsvrlav"
#   sql_admin_username = "sqladminlav"
#   sql_admin_password = "Devopslav@1001"
#   sql_database_name  = "devtodoappdblav"

#   tags = local.common_tags
# }