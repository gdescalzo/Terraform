#!/bin/bash

#ORGANIZATION_ID="$2"
PROJECT_ID=$1
ACCOUNT_ID=$(gcloud alpha billing accounts list |awk '{print $1}'|grep -v 'ACCOUNT_ID')
SERVICE_ACCOUNT_ID=$PROJECT_ID
DESCRIPTION="Cuenta de servicio para $PROJECT_ID"
DISPLAY_NAME="$PROJECT_ID"
KEY_FILE="credentials"

## Creamos el proyecto
gcloud alpha projects create $PROJECT_ID # [--organization $ORGANIZATION_ID]

## Asociamos la cuenta de facturacion a el proyecto creado
gcloud alpha billing accounts projects link $PROJECT_ID --billing-account=$ACCOUNT_ID

## Creamos el service account para el proyecto.
gcloud iam service-accounts create $SERVICE_ACCOUNT_ID --display-name=$DISPLAY_NAME --project=$PROJECT_ID

## Asignamos un role al service account (admin)
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:$SERVICE_ACCOUNT_ID@$PROJECT_ID.iam.gserviceaccount.com" --role="roles/owner"

## Creamo la key de la service account
gcloud iam service-accounts keys create ./vars/$KEY_FILE.json --iam-account=$SERVICE_ACCOUNT_ID@$PROJECT_ID.iam.gserviceaccount.com

## Habilitamos las API para el Proyecto

# Kubernetes API
gcloud --project $PROJECT_ID services enable container.googleapis.com

# Compute API
gcloud --project $PROJECT_ID services enable compute.googleapis.com

# Service Networking API
gcloud --project $PROJECT_ID services enable servicenetworking.googleapis.com

export GOOGLE_APPLICATION_CREDENTIALS=credentials.json
export GOOGLE_PROJECT_ID=$PROJECT_ID
export GOOGLE_PROJECT_NETWORK=(gcloud compute networks list --project $PROJECT_ID |awk '{print $1}'|grep -v 'NAME')