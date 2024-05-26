resource_group_name = "prod-rg"
location            = "East US"
vnet_name           = "prod-vnet"
subnet_name         = "prod-subnet"
admin_username      = "adminuser"
admin_password      = "Password1234!"
vm_count            = 3
vm_publisher        = "Canonical"
vm_offer            = "UbuntuServer"
vm_sku              = "22.04-LTS"
vm_version          = "latest"
tags = {
    Owner = "PROD team"
    Env   = "PROD"
}
