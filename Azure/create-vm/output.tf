output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.base-vnet.name
}

output "vnet_address_space" {
  description = "The address space of the virtual network"
  value       = azurerm_virtual_network.base-vnet.address_space
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = azurerm_subnet.base-subnet.name
}

output "subnet_address_prefixes" {
  description = "The address prefixes of the subnet"
  value       = azurerm_subnet.base-subnet.address_prefixes
}
