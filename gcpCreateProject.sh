#!/bin/bash

# Declaramos las variables 
source ./vars/vars

# Incluimos las librerias.
source ./func/gcpLogin
source ./func/gcpEnableGcpApis
source ./func/gcpDeleteDefaultSubnet
source ./func/showMessage

##  Creamos el proyecto
    showMessage "Creamos el proyecto"
    gcloud alpha projects create $PROJECT_ID # [--organization $ORGANIZATION_ID]

    ## Asociamos la cuenta de facturacion a el proyecto creado
    showMessage "Asociamos la cuenta de facturacion al proyecto creado"
    gcloud alpha billing accounts projects link $PROJECT_ID \
    --billing-account=$ACCOUNT_ID

    ## Creamos el service account para el proyecto.
    showMessage "Creamos el service account para el proyecto"
    gcloud iam service-accounts create $SERVICE_ACCOUNT_ID \
    --display-name=$DISPLAY_NAME \
    --project=$PROJECT_ID

    ## Asignamos un role al service account (admin)
    showMessage "Asignamos un role al service account (admin)"
    gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SERVICE_ACCOUNT_ID@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/owner"

    ## Creamos la key de la service account
    showMessage "Descargamos las credenciales"
    gcloud iam service-accounts keys create ./manifest/VARS/$KEY_FILE.json \
    --iam-account=$SERVICE_ACCOUNT_ID@$PROJECT_ID.iam.gserviceaccount.com

# Habilitamos las APIs
    showMessage "Habilitamos API Network Compute y Kubernetes"
    echo "Lesto puede tardar..." && date
    echo ""
        gcp_EnableApis $PROJECT_ID
    echo ""
    echo ">>>>>>>>>> Compute y Kubernetes habilitadas <<<<<<<<<<"
    date

# Eliminamos la default network
    showMessage "Eliminamos la default network"
        gpc_DeleteDefaulNetwork $PROJECT_ID
    echo ""
    echo ">>>>>>>>>>>>>> Default network eliminada <<<<<<<<<<<<<"

# Exportamos la variables de entorno para Terraform y Ansible.
    showMessage "Export vars de entorno para Terraform y Ansible"
    export TF_VAR_gcpAppPwd=$(pwd)/manifest/VARS/$KEY_FILE.json
    export TF_VAR_gcpProjectId=$PROJECT_ID
    export TF_VAR_gcpSAdisplayName=$(gcloud iam service-accounts list --format="table(displayName)" --project $PROJECT_ID | awk '{print $1}' | grep -v 'NAME' |grep "$PROJECT_ID")
    export TF_VAR_gcpSAid=$(gcloud iam service-accounts list --format="table(email)" --project $PROJECT_ID | awk '{print $1}' | grep -v 'EMAIL' |grep "$PROJECT_ID")
    bash