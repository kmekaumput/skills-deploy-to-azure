# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.47.0"
    }
  }
}

provider "azurerm" {

  features {}

}

# Create a resource group
resource "azurerm_resource_group" "webapp" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "webapp" {
  name                = var.app_plan
  resource_group_name = azurerm_resource_group.webapp.name
  location            = azurerm_resource_group.webapp.location
  os_type             = "Linux"
  sku_name            = "F1"

}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.webapp_name
  resource_group_name = azurerm_resource_group.webapp.name
  location            = azurerm_service_plan.webapp.location
  service_plan_id     = azurerm_service_plan.webapp.id


  site_config {
    always_on = false

    application_stack {
      docker_image_name        = "nginx"
      docker_registry_url      = var.image_registry_url
      docker_registry_username = var.image_registry_username
      docker_registry_password = var.image_registry_password
    }
  }

  identity {
    type = "SystemAssigned"
  }

}
