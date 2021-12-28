terraform {
  required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = "=2.90.0"
      }
  }
    backend "azurerm" {
        resource_group_name  = "RG-CloudShell"
        storage_account_name = "terrastatestorage19648"
        container_name       = "terraform"
        key                  = "modchallenge.terraform.tfstate"
    }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "pet-01"
  location = "westeurope"
  tags = {
    Env = "Prod"
    Owner = "Vadym"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-pet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "snet-pet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

module "server" {
  source = "./modules/server"

  name                      = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  snet_id                   = azurerm_subnet.subnet.id
  nic_config_name           = "internal"
  nic_private_ip_allocation = "Dynamic"

  servername     = "vm-pet-01"
  vm_size        = "Standard_B1s"
  admin_username = "VM_admin"
  admin_password = "$ecure_P@$sw0rD"

  caching    = "ReadWrite"

  os = {
  publisher = "MicrosoftWindowsServer"
  offer     = "WindowsServer"
  sku       = "2016-Datacenter"
  version   = "latest"
  }
}
