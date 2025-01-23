variable "client_secret" {}
variable "client_id" {}
variable "subscription_id" {}
variable "tenant_id" {}

# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

# Create the resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.project_name}-${var.environment}-${random_integer.ri.result}"
  location = var.location
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "${var.project_name}-${var.environment}-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "P1v2"
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                  = "webapp-${random_integer.ri.result}"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  service_plan_id       = azurerm_service_plan.appserviceplan.id

  site_config {
    application_stack {
      python_version = "3.9"

    }
    minimum_tls_version = "1.2"
  }
}

# Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id                 = azurerm_linux_web_app.webapp.id
  repo_url               = "https://github.com/Azure-Samples/msdocs-python-flask-webapp-quickstart"
  branch                 = "main"
  use_mercurial          = false
  use_manual_integration = true
}

