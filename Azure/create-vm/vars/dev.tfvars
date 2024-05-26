resource_group_name = "dev-rg"
location            = "Central US"
vnet_name           = "dev-vnet"
subnet_name         = "dev-subnet"
admin_username      = "adminuser"
admin_password      = "Password1234!"
vm_count            = 3
vm_publisher        = "Canonical"
vm_offer            = "UbuntuServer"
vm_sku              = "22.04-LTS"
vm_version          = "latest"
tags = {
    Owner = "DEV team"
    Env   = "DEV"
}
