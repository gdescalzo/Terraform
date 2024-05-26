environment = "qa"
location = "East US 2"
resource_group_name = "prod-rg"
tags = {
    Owner = "QA team"
    Env = "QA"
}

vnet_name      = "prod-vnet"
subnet_name    = "prod-subnet"
address_space  = ["10.0.0.0/16"]
subnet_prefixes = ["10.0.1.0/24"]