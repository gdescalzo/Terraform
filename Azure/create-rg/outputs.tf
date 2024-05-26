// output.tf
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.base-rg.name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.base-rg.location
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.base-rg.id
}
