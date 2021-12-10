#!/bin/bash

# Declaramos las variables 
. ./vars/vars

# Incluimos las librerias.
. ./func/gcpLogin
. ./func/gcpEnableGcpApis
. ./func/gcpDeleteDefaultSubnet
. ./func/showMessage

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

    ## Asignamos un role al service account (Cloud SQL)
    showMessage "Asignamos un role al Cloud SQL (admin)"
    gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SERVICE_ACCOUNT_ID@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/cloudsql.admin"

    ## Asignamos un role al service account (Serverless VPC Access)
    showMessage "Asignamos un role al Serverless VPC Access (admin)"
    gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SERVICE_ACCOUNT_ID@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/vpcaccess.admin"

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
    export TF_VAR_gcpRegion="southamerica-west1"
    export TF_VAR_gcpZone="southamerica-west1-a"
    bash