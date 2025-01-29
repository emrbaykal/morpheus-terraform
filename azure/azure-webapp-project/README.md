# Azure Web App Terraform Implementation

This project contains Terraform configurations for deploying and managing Azure Web Applications through Morpheus.

## Project Structure

```
azure-webapp-project/
├── main.tf          # Main Azure Web App configuration
├── variables.tf     # Input variables
├── outputs.tf       # Output definitions
└── providers.tf     # Azure provider configuration
```

## Resource Components

### Core Resources
- Azure Resource Group
- App Service Plan
- Azure Web App
- Application Insights
- Azure SQL Database (optional)

## Configuration Details

### Provider Configuration
```hcl
provider "azurerm" {
  features {}
}

provider "morpheus" {
  url = var.morpheus_url
}
```

### Resource Group
Creates a resource group to contain all related resources:
```hcl
resource "azurerm_resource_group" "webapp" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}
```

### App Service Plan
Defines the compute resources for your web app:
```hcl
resource "azurerm_service_plan" "webapp" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.webapp.name
  location            = azurerm_resource_group.webapp.location
  sku_name            = var.sku_name
  os_type             = "Windows"
}
```

### Web App
Main web application configuration:
```hcl
resource "azurerm_windows_web_app" "webapp" {
  name                = var.webapp_name
  resource_group_name = azurerm_resource_group.webapp.name
  location            = azurerm_resource_group.webapp.location
  service_plan_id     = azurerm_service_plan.webapp.id

  site_config {
    application_stack {
      current_stack  = "dotnet"
      dotnet_version = "v6.0"
    }
  }
}
```

## Variables

Key variables that need to be configured:

- `resource_group_name`: Name of the Azure resource group
- `location`: Azure region for deployment
- `webapp_name`: Name of the web application
- `sku_name`: App Service Plan SKU (e.g., "P1v2")

## Outputs

Important outputs provided:

- Web App URL
- Resource Group ID
- App Service Plan ID

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Review the plan:
```bash
terraform plan -var-file="environment.tfvars"
```

3. Apply the configuration:
```bash
terraform apply -var-file="environment.tfvars"
```

## Environment Variables

Create an `environment.tfvars` file with your specific values:
```hcl
resource_group_name = "my-webapp-rg"
location           = "westeurope"
webapp_name        = "my-webapp"
sku_name           = "P1v2"
```

## Notes
- Make sure you have the necessary Azure credentials configured
- Review the App Service Plan SKU to match your requirements
- Consider adding application-specific configurations in the site_config block
