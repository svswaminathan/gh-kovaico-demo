# terraform scripts to follow here
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-kovaico-tfstate"
    storage_account_name = "stkovaicotfstate"
    container_name       = "stckovaicotfstate"
    key                  = "stckovaicotfstate.tfstate"
  }
}

provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}

data "azurerm_client_config" "current" {}

#Create Resource Group
resource "azurerm_resource_group" "rgkovaicotrial" {
  name     = "rgkovaicotrial"
  location = "southindia"
}
  