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


resource "azurerm_resource_group" "kubernetes_container_group_resource_group" {
  name     = "kubernetes-cluster-resource-group"
  location = "Canada Central"
}

resource "azurerm_container_group" "kubernetes_container_group" {
  name                = "kubernetes-container-group"
  location            = azurerm_resource_group.kubernetes_container_group_resource_group.location
  resource_group_name = azurerm_resource_group.kubernetes_container_group_resource_group.name
  dns_name_label = "hello-world"

  os_type = "Linux"

  container {
    name   = "hello-world"
    image  = "mcr.microsoft.com/oss/nginx/nginx:1.9.15-alpine"
    cpu    = "1"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}
