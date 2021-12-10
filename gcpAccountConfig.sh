#!/bin/bash

# Declaramos las variables 
source ./vars/vars

# Cargamos las librerias
source ./func/gcpChecks

if ! gcloudInstallCheck1 and gcloudInstallCheck2
then
    echo "gcloud could not be found"
    exit
else 
    echo "gcloud is installed"
fi


