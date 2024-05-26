environment         = "prod"
location            = "East US"
resource_group_name = "prod-rg"
tags = {
    Owner = "PROD team"
    Env   = "PROD"
}

vnet_name      = "prod-vnet"
subnet_name    = "prod-subnet"
address_space  = ["10.0.0.0/16"]
subnet_prefixes = ["10.0.1.0/24"]
