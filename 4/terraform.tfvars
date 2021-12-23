os = {
  publisher = "MicrosoftWindowsServer"
  offer     = "WindowsServer"
  sku       = "2016-Datacenter"
  version   = "latest"
}

tags = {
  Env = "Prod"
  Owner = "Vadym"
}

application = "pet"

location = "westeurope"

admin_username = "VM_admin"
admin_password = "$ecure_P@$sw0rD"

vnet_address_space = ["10.0.0.0/16"]

snet_address_space = ["10.0.0.0/24"]

vm_size = "Standard_B1s"