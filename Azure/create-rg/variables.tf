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

variable "environment" {
    description = "The enviroment where will deploy to."
    type = string
    validation {
      condition = contains(["dev", "qa", "prod"],var.environment)
      error_message = "The environment should be: 'dev', 'qa', 'prod'"
    }  
}

variable "location" {
  description = "The Azure region to deploy to."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}