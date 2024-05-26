# Terraform Azure Virtual Network Deployment

This project demonstrates how to use Terraform to create an Azure Resource Group and a Virtual Network (VNet) with a single subnet. It includes environment-specific configurations and uses Terraform to manage infrastructure as code.

## Project Structure

```
your-terraform-project/
├── create-vnet/
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
    cd your-terraform-project/create-rg
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
    environment         = "prod"
    location            = "East US"
    resource_group_name = "prod-rg"
    vnet_name           = "prod-vnet"
    subnet_name         = "prod-subnet"
    address_space       = ["10.0.0.0/16"]
    subnet_prefixes     = ["10.0.1.0/24"]
    tags = {
        Owner = "PROD team"
        Env   = "PROD"
    }
    ```

## Usage

### Creating the Resource Group

1. **Navigate to the `create-rg` directory**:

    ```bash
    cd your-terraform-project/create-rg
    ```

2. **Initialize Terraform**:

    ```bash
    terraform init
    ```

3. **Plan the Deployment**:

    ```bash
    terraform plan -var-file="vars/credentials.tfvars" -var-file="vars/prod.tfvars"
    ```

4. **Apply the Deployment**:

    ```bash
    terraform apply -var-file="vars/credentials.tfvars" -var-file="vars/prod.tfvars"
    ```

### Creating the Virtual Network

1. **Navigate to the `create-vnet` directory**:

    ```bash
    cd your-terraform-project/create-vnet
    ```

2. **Initialize Terraform**:

    ```bash
    terraform init
    ```

    ![Terraform Init Output](./img/terraform-init-output.png)

3. **Plan the Deployment**:

    ```bash
    terraform plan -var-file="vars/credentials.tfvars" -var-file="vars/prod.tfvars"
    ```

    ![Terraform Plan Output](./img/terraform-plan-output.png)

4. **Apply the Deployment**:

    ```bash
    terraform apply -var-file="vars/credentials.tfvars" -var-file="vars/prod.tfvars"
    ```

    ![Terraform Apply Output](./img/terraform-apply-output.png)

5. **Browse Azure Virtual Network**

    ![azure-vent-git](./img/azure-vnet-gui.png)

## Destroying the Infrastructure

To clean up and remove all resources created by Terraform, run the following command from the relevant directory (`create-rg` or `create-vnet`):

```bash
terraform destroy -var-file="vars/credentials.tfvars" -var-file="vars/prod.tfvars"
```

![Terraform Destroy Output](./img/terraform-destroy-output_1.png)


