provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "base-rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}