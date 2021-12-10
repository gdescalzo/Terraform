#!/bin/bash

# Cargamos las librerias
. ./func/checkOS
. ./func/installGcloud
. ./func/installDependencies

# Verificamos OS y Plataformas
checkOS

# Instalamos Dependencias
installDependencies gcloudInstall



