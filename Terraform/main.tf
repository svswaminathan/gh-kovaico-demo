# terraform scripts to follow here
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-kovaico-tfstate"
    storage_account_name = "stkovaicotfstate"
    container_name       = "stckovaicotfstate"
    key                  = "stckovaicotfstate.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.2.0"
    }
  }
}

provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  features {}
}

data "azurerm_client_config" "current" {}

#Resource Group
resource "azurerm_resource_group" "rgkovaicotrial" {
  name     = "rgkovaicotrial"
  location = "southindia"
}

# App service plan
resource "azurerm_service_plan" "aspkovaicotrial" {
  name                = "aspkovaicotrial"
  resource_group_name = azurerm_resource_group.rgkovaicotrial.name
  location            = "South India"
  os_type             = "Linux"
  sku_name            = "P1v2"
}

# Linux web app 
resource "azurerm_linux_web_app" "webkovaicotrial" {
  name                = "webkovaicotrial"
  resource_group_name = azurerm_resource_group.rgkovaicotrial.name
  location            = azurerm_service_plan.aspkovaicotrial.location
  service_plan_id     = azurerm_service_plan.aspkovaicotrial.id
  site_config {}
}

resource "azurerm_resource_group" "rgkovaicotrial-test" {
  name     = "rgkovaicotrialtest"
  location = "southindia"
}

resource "azurerm_resource_group" "rgkovaicodemo-prod" {
  name     = "rgkovaicodemo-prod"
  location = "southindia"
}

# App service plan
resource "azurerm_service_plan" "aspkovaicodemoprod" {
  name                = "aspkovaicodemoprod"
  resource_group_name = azurerm_resource_group.rgkovaicodemo-prod.name
  location            = "South India"
  os_type             = "Linux"
  sku_name            = "P1v2"
}

# Linux web app 
resource "azurerm_linux_web_app" "webkovaicodemoprod" {
  name                = "webkovaicodemoprod"
  resource_group_name = azurerm_resource_group.rgkovaicodemo-prod.name
  location            = azurerm_service_plan.aspkovaicodemoprod.location
  service_plan_id     = azurerm_service_plan.aspkovaicodemoprod.id
  site_config {}
}
