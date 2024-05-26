resource_group_name = "qa-rg"
location            = "East US 2"
vnet_name           = "qa-vnet"
subnet_name         = "qa-subnet"
admin_username      = "adminuser"
admin_password      = "Password1234!"
vm_count            = 3
vm_publisher        = "Canonical"
vm_offer            = "UbuntuServer"
vm_sku              = "22.04-LTS"
vm_version          = "latest"
tags = {
    Owner = "QA team"
    Env   = "QA"
}
