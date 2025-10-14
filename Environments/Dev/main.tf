locals {
  common_tags = {
    ManagedBy   = "Terraform"
    owner       = "Lavlesh"
    project     = "Todo-App"
    environment = "Dev"
  }
}
module "resource_group" {
  source   = "../../Modules/Azurerm_Resource_Group"
  rg_name  = "dev-todoapp-rglav"
  location = "central india"
  tags     = local.common_tags
}
module "storage_account" {
  depends_on = [module.resource_group]

  source                   = "../../Modules/Azurerm_Storage_Acnt"
  stg_name                 = "devtodoappstglav"
  rg_name                  = "dev-todoapp-rglav"
  location                 = "central india"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.common_tags
}
module "container_registry" {
  depends_on = [module.resource_group]

  source   = "../../Modules/Azurerm_Container_Registry"
  acr_name = "devtodoappacrlav"
  rg_name  = "dev-todoapp-rglav"
  location = "central india"
  tags     = local.common_tags
}
module "kubernetes_cluster" {
  depends_on = [module.resource_group]

  source       = "../../Modules/Azurerm_K8s_Cluster"
  cluster_name = "dev-todoapp-aks-lav"
  rg_name      = "dev-todoapp-rglav"
  location     = "central india"
  dns_prefix   = "dev-todoapp-aks-lav"
  node_count   = 2
  vm_size      = "Standard_D2s_v3"
  tags         = local.common_tags
}

module "sql_server" {
  depends_on = [module.resource_group]

  source             = "../../Modules/Azurerm_SQL_Server"
  sql_server_name    = "devtodoappsqlsvrlav"
  rg_name            = "dev-todoapp-rglav"
  location           = "central india"
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
