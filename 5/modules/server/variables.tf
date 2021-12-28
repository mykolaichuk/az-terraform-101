variable "nic_config_name" {
  type = string
  description = "Name of NIC configuration"
}

variable "servername" {
  type = string
  description = "Name of the server"
}

variable "nic_private_ip_allocation" {
  type = string
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static"
}

variable "os" {
  description = "OS image to deploy"
  type = object({
   publisher = string
   offer     = string
   sku       = string
   version   = string
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


variable "vm_size" {
  type        = string
  description = "Virtual machine size"
}

variable "snet_id" {
  type = string
  description = "ID of the subnet to assign to the Network Interface resource"
}

variable "caching" {
  type = string
  description = "Defines caching type for OS disk"
}

variable "name" {
  type = string
  description = "Name of the resource group"
}