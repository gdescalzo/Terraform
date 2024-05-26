# Terraform Azure Virtual Machine Deployment

This project demonstrates how to use Terraform to create multiple virtual machines (VMs) on Azure. The VMs run Ubuntu 22.04 and are part of a specified virtual network and subnet.

## Project Structure

```
your-terraform-project/
├── create-vm/
│ ├── main.tf
│ ├── variables.tf
│ ├── output.tf
│ ├── README.md
│ ├── vars/
│ │ ├── credentials.tfvars
│ │ ├── dev.tfvars
│ │ ├── prod.tfvars
│ │ └── qa.tfvars
└── ...
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed
- Azure subscription

## Setup

1. **Clone the repository**:

    ```bash
    git clone <repository-url>
    cd your-terraform-project/create-vm
    ```

2. **Configure Azure CLI**:

    Log in to your Azure account and set the subscription:

    ```bash
    az login
    az account set --subscription "<YOUR_SUBSCRIPTION_ID>"
    ```

3. **Create a Service Principal**:

    ```bash
    az ad sp create-for-rbac --name "terraform-sp" --role="Contributor" --scopes="/subscriptions/<YOUR_SUBSCRIPTION_ID>"
    ```

    Save the output containing `appId`, `tenant`, `password`, and `subscriptionId`.

4. **Update `credentials.tfvars`**:

    Add the service principal credentials to `vars/credentials.tfvars`:

    ```hcl
    client_id       = "YOUR_APP_ID"
    client_secret   = "YOUR_CLIENT_SECRET"
    tenant_id       = "YOUR_TENANT_ID"
    subscription_id = "YOUR_SUBSCRIPTION_ID"
    ```

5. **Configure Environment Variables**:

    Update the environment-specific variable files (e.g., `vars/prod.tfvars`):

    ```hcl
    resource_group_name = "prod-rg"
    location            = "East US"
    vnet_name           = "prod-vnet"
    subnet_name         = "prod-subnet"
    admin_username      = "someuser"
    admin_password      = "somepassword"
    vm_count            = 3
    vm_publisher        = "Canonical"
    vm_offer            = "UbuntuServer"
    vm_sku              = "22.04-LTS"
    vm_version          = "latest"
    tags = {
        Owner = "PROD team"
        Env   = "PROD"
    }
    ```
