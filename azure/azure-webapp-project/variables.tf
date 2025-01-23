variable "project_name" {
  description = "Project name"
  default     = "webapp"
}

variable "environment" {
  description = "Environment name"
  default     = "dev"
}

variable "location" {
  description = "Azure region"
  default     = "westeurope"
}

variable "client_secret" {}
variable "client_id" {}
variable "subscription_id" {}
variable "tenant_id" {}