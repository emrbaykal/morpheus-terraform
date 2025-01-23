# Azure Web App with Python Flask using Terraform

This project sets up an Azure Web App to host a Python Flask web application using Terraform. The configuration includes creating a resource group, an App Service Plan, and a Linux Web App. The web app is configured to deploy code from a specified GitHub repository.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed
- An Azure account
- A GitHub account

## Project Structure

```plaintext
azure-webapp-project/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── providers.tf
└── README.md