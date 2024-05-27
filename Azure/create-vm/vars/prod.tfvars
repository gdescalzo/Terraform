resource_group_name = "prod-rg"
location            = "East US"
vnet_name           = "prod-vnet"
subnet_name         = "prod-subnet"
admin_username      = "adminuser"
admin_password      = "Password1234!"
vm_count            = 1
vm_size             = "Standard_B2ats_v2"
vm_publisher        = "Canonical"
vm_offer            = "UbuntuServer"
vm_sku              = "19.10-DAILY"
vm_version          = "latest"
tags = {
    Owner = "PROD team"
    Env   = "PROD"
}