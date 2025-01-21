# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "ai_service_plan_resource_group" {
  name     = "ai-app-service-plan-resource-group"
  location = "Canada Central"
}

# Storage Account within the Resource Group
resource "azurerm_storage_account" "ai_service_plan_storage_account" {
  name                     = "aiteststorageacount"
  resource_group_name      = azurerm_resource_group.ai_service_plan_resource_group.name
  location                 = azurerm_resource_group.ai_service_plan_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# App Service Plan within the Resource Group
resource "azurerm_service_plan" "ai_service_plan" {
  name                = "ai-service-plan"
  location            = azurerm_resource_group.ai_service_plan_resource_group.location
  resource_group_name = azurerm_resource_group.ai_service_plan_resource_group.name
  os_type = "Linux"

  sku_name = "F1"

}
