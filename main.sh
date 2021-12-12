#!/bin/bash

# Declaramos las variables 
. ./vars/vars

# Incluimos las librerias.
. ./func/gcpCreateProject
. ./func/gcpCreateSAkey
. ./func/gcpDeleteDefaultSubnet
. ./func/gcpEnableGcpApis
. ./func/gcpEnableRoles
. ./func/exportTFvars

    ## Creamos el proyecto
    gcp_CreateProject $PROJECT_ID $ACCOUNT_ID $SERVICE_ACCOUNT_ID $DISPLAY_NAME

    ## Asignamos Role al service account:
    gcp_EnableRoles $SERVICE_ACCOUNT_ID $PROJECT_ID

    ## Creamos la key de la service account
    gpc_CreateSAkey $KEY_FILE $SERVICE_ACCOUNT_ID $PROJECT_ID

    ## Habilitamos las APIs
    gcp_EnableApis $PROJECT_ID

    ## Eliminamos la default network  
    gpc_DeleteDefaulNetwork $PROJECT_ID

    ## Exportamos la variables de entorno para Terraform y Ansible.
    exportTFvars $PROJECT_ID $KEY_FILE