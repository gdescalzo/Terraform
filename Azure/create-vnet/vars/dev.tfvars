environment = "dev"
location = "Central US"
resource_group_name = "dev-rg"
tags = {
    Owner = "DEV team"
    Env = "DEV"
}

vnet_name      = "dev-vnet"
subnet_name    = "dev-subnet"
address_space  = ["10.0.0.0/16"]
subnet_prefixes = ["10.0.1.0/24"]