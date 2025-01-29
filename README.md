# Morpheus Terraform Provider

This repository contains Terraform configurations for managing Morpheus cloud resources. It enables Infrastructure as Code (IaC) management for Morpheus deployments.

## Prerequisites

- Terraform v0.14.x or higher
- A Morpheus account with API access
- Valid Morpheus API credentials

## Resource Types

This provider supports the following Morpheus resources:

- Instance Types
- Workflows
- Networks
- Cloud Formations
- Tasks
- Users and Groups

## Terraform Code Structure

The repository is organized into the following structure:

```
├── main.tf          # Main Terraform configuration file
├── variables.tf     # Input variables declaration
├── outputs.tf       # Output values definition
├── providers.tf     # Provider configuration
└── modules/         # Reusable Terraform modules
    ├── instance/    # Instance management module
    ├── network/     # Network configuration module
    └── workflow/    # Workflow management module
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please open an issue in the GitHub repository.