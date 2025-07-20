provider "azurerm" {
  features {}

subscription_id = "c6dd8e77-6e8a-4de1-8b4d-7d15d57dbb71"
}

resource "azurerm_resource_group" "resume_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "resume_storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.resume_rg.name
  location                 = azurerm_resource_group.resume_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account_static_website" "resume_site" {
  storage_account_id = azurerm_storage_account.resume_storage.id

  index_document     = "index.html"
  error_404_document = "404.html"
}

# App Service Plan
resource "azurerm_service_plan" "resume_fn_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.resume_rg.location
  resource_group_name = azurerm_resource_group.resume_rg.name
  os_type             = "Linux"
  sku_name            = "Y1" # Consumption plan (serverless)
}

# Storage for Function App (must be separate from static website SA)
resource "azurerm_storage_account" "function_storage" {
  name                     = "vithufuncstorage01"  # must be globally unique
  resource_group_name      = azurerm_resource_group.resume_rg.name
  location                 = azurerm_resource_group.resume_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Application Insights
resource "azurerm_application_insights" "resume_insights" {
  name                = "vithu-appinsights01"
  location            = azurerm_resource_group.resume_rg.location
  resource_group_name = azurerm_resource_group.resume_rg.name
  application_type    = "web"
}

# Linux Function App
resource "azurerm_linux_function_app" "resume_fn" {
  name                       = var.function_app_name
  location                   = azurerm_resource_group.resume_rg.location
  resource_group_name        = azurerm_resource_group.resume_rg.name
  service_plan_id            = azurerm_service_plan.resume_fn_plan.id
  storage_account_name       = azurerm_storage_account.function_storage.name
  storage_account_access_key = azurerm_storage_account.function_storage.primary_access_key
  functions_extension_version = var.function_runtime_version
  site_config {
    application_stack {
      python_version = "3.11"
    }
  }
  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.resume_insights.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.resume_insights.connection_string
    "COSMOS_DB_URL"         = "https://resterraformcosmosdb.documents.azure.com:443/"
    "COSMOS_DB_KEY"         = "REMOVED_SECRET"
    "COSMOS_DB_NAME"        = "ResumeTerraform"
    "COSMOS_CONTAINER_NAME" = "Counter_1"
  }
}