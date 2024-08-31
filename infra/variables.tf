variable "subscription_id" {
  description = "The subscription ID in which to create the resources."
  type        = string
}

variable "client_id" {
  description = "The client ID for authenticating with Azure."
  type        = string
}

variable "client_secret" {
  description = "The client secret for authenticating with Azure."
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID for authenticating with Azure."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "donet-example-resources"
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "West US"
}

variable "container_registry_name" {
  description = "The name of the Azure Container Registry."
  type        = string
  default     = "exampleregistry"
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
  default     = "donet-sampleapp-example-plan"
}

variable "app_service_sku_tier" {
  description = "The SKU tier of the App Service Plan."
  type        = string
  default     = "Standard"
}

variable "app_service_sku_size" {
  description = "The SKU size of the App Service Plan."
  type        = string
  default     = "S1"
}

variable "test_app_service_name" {
  description = "The name of the test environment App Service."
  type        = string
  default     = "test-donet-sampleapp-example-test"
}

variable "production_app_service_name" {
  description = "The name of the production environment App Service."
  type        = string
  default     = "production-donet-sampleapp-example-production"
}

variable "docker_image" {
  description = "The Docker image to deploy to the App Service."
  type        = string
  default     = "gskr8990/dotnet-sample-app:v1"
}
