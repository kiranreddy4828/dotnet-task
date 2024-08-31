# Configure Azure Provider
provider "azurerm" {
  version         = "4.0.1"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# Create Resource Group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# Create Container Registry
resource "azurerm_container_registry" "example" {
  name                = var.container_registry_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Standard"
}

# Create App Service Plan
resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  kind                = "Linux"
  reserved            = true

  sku {
    tier = var.app_service_sku_tier
    size = var.app_service_sku_size
  }
}

# Create App Service (Test Environment)
resource "azurerm_app_service" "test" {
  name                = var.test_app_service_name
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    linux_fx_version = "DOCKER|${var.docker_image}"
  }
}

# Create App Service (Production Environment)
resource "azurerm_app_service" "production" {
  name                = var.production_app_service_name
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    linux_fx_version = "DOCKER|${var.docker_image}"
  }
}
