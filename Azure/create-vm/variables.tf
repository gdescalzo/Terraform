variable "client_id" {
  description = "The Client ID of the Service Principal"
}

variable "client_secret" {
  description = "The Client Secret of the Service Principal"
}

variable "tenant_id" {
  description = "The Tenant ID of the Service Principal"
}

variable "subscription_id" {
  description = "The Subscription ID"
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
}

variable "location" {
  description = "The Azure region where resources will be created"
}

variable "vnet_name" {
  description = "The name of the Virtual Network"
}

variable "subnet_name" {
  description = "The name of the Subnet"
}

variable "admin_username" {
  description = "The admin username for the VM"
}

variable "admin_password" {
  description = "The admin password for the VM"
  sensitive   = true
}

variable "vm_count" {
  description = "The number of VMs to create"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "The size of the Virtual Machine"
  default     = "Standard_B1ls"
}

variable "vm_publisher" {
  description = "The publisher of the VM image"
  default     = "Canonical"
}

variable "vm_offer" {
  description = "The offer of the VM image"
  default     = "UbuntuServer"
}

variable "vm_sku" {
  description = "The SKU of the VM image"
  default     = "20.04-LTS"
}

variable "vm_version" {
  description = "The version of the VM image"
  default     = "latest"
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}
