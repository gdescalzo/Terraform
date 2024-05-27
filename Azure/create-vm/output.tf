output "vm_names" {
  description = "The names of the VMs"
  value       = [for vm in azurerm_virtual_machine.vm : vm.name]
}

output "vm_ids" {
  description = "The IDs of the VMs"
  value       = [for vm in azurerm_virtual_machine.vm : vm.id]
}

output "vm_private_ips" {
  description = "The private IPs of the VMs"
  value       = [for nic in azurerm_network_interface.vm_nic : nic.private_ip_address]
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = data.azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  description = "The address space of the virtual network"
  value       = data.azurerm_virtual_network.vnet.address_space
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = data.azurerm_subnet.subnet.name
}

output "subnet_address_prefixes" {
  description = "The address prefixes of the subnet"
  value       = data.azurerm_subnet.subnet.address_prefixes
}
