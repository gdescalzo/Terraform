environment = "qa"
location = "East US 2"
resource_group_name = "qa-rg"
tags = {
    Owner = "QA team"
    Env = "QA"
}

vnet_name      = "qa-vnet"
subnet_name    = "qa-subnet"
address_space  = ["10.0.0.0/16"]
subnet_prefixes = ["10.0.1.0/24"]