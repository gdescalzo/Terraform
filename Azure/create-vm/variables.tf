variable "client_id" {
  description = "The Client ID of the Service Principal"
  type        = string
}

variable "client_secret" {
  description = "The Client Secret of the Service Principal"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "The Tenant ID of the Azure subscription"
  type        = string
}

variable "subscription_id" {
  description = "The Subscription ID of the Azure subscription"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy to."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the VM"
  type        = string
  sensitive   = true
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 3
}

variable "vm_publisher" {
  description = "The publisher of the VM image"
  type        = string
  default     = "Canonical"
}

variable "vm_offer" {
  description = "The offer of the VM image"
  type        = string
  default     = "UbuntuServer"
}

variable "vm_sku" {
  description = "The SKU of the VM image"
  type        = string
  default     = "22.04-LTS"
}

variable "vm_version" {
  description = "The version of the VM image"
  type        = string
  default     = "latest"
}
