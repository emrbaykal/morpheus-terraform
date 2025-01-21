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
resource "azurerm_resource_group" "postgresql_server_resource_group" {
  name     = "postgresql-database-resource-group"
  location = "Canada Central"
}

# PostgreSQL Server within the Resource Group
resource "azurerm_postgresql_server" "simple_postgresql_server" {
  name                = "simple-postgresql-database-name"
  resource_group_name = azurerm_resource_group.postgresql_server_resource_group.name
  location            = azurerm_resource_group.postgresql_server_resource_group.location

  sku_name = "B_Gen5_1"
  version  = "11"

  administrator_login          = "hpe"
  administrator_login_password = "HP1nv3nt!"

  ssl_enforcement_enabled = true
}