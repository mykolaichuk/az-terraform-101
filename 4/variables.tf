variable "os" {
  description = "OS image to deploy"
  type = object({
   publisher = string
   offer     = string
   sku       = string
   version   = string
  })
}

variable "tags"{
  description = "Defines resources tags"
  type = object({
   Env   = string
   Owner = string
  })
}

variable "storage_account_type" {
  type         = map
  description  = "SA account type depends on a location"

  default = {
    eastus     = "Premium_LRS"
    westeurope = "Standard_LRS"
  }
}

variable "application" {
  type = string
  description = "Application name which will be used in naming accross resources"
}

variable "location" {
  type        = string
  description = "Resources location"
}

variable "admin_username" {
  type           = string
  #descriptiption = "Local admin username"
}

variable "admin_password" {
  type = string
  description = "Local admin password"
  sensitive = true
}

variable "vnet_address_space" {
  type        = list
  description = "Virtual network address space"  
}

variable "snet_address_space" {
  type        = list
  description = "Subnet address space"
}

variable "vm_size" {
  type        = string
  description = "Virtual machine size"
}