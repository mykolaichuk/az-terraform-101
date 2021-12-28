terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.90.0"
    }
  }
}
resource "azurerm_network_interface" "nic" {
  name                = "nic-${var.servername}"
  location            = var.location #need to be defined in the root main.tf
  resource_group_name = var.name #need to be defined in the root main.tf

  ip_configuration {
    name                          = var.nic_config_name
    subnet_id                     = var.snet_id #need to be defined in the root main.tf
    private_ip_address_allocation = var.nic_private_ip_allocation
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                  = var.servername
  resource_group_name   = var.name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.nic.id ]

  os_disk {
    caching              = var.caching
    storage_account_type = lookup(var.storage_account_type, var.location, "Standard_LRS")
  }

  source_image_reference {
    publisher = var.os.publisher
    offer     = var.os.offer
    sku       = var.os.sku
    version   = var.os.version
  }
}