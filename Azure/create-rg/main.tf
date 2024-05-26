provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

}

resource "azurerm_resource_group" "base-rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}