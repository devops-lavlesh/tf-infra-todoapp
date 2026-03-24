variable "app_name" {
    description = "Name of the Web App"
    type        = string
}
variable "app_service_plan" {
    description = "App Service Plan Name"
    type        = string
}
variable "rg_name" {}
variable "location" {}
variable "sql_server_name" {}
variable "sql_admin_username" {}
variable "sql_admin_password" {} 
variable "sql_database_name" {}
variable "tags" {}