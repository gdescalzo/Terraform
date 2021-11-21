# Terraform-gcp

Repositorio de Terraform , para despliegues en GCP.
## Requisitos para utilizar este codigo:

Para utilizar el siguiente codigo debemos, cumplir con ciertos requisitos a fin de garantizar conectividad segura entre GCP y nuestro "Terraform Server".
## Algunas consideraciones.

Es recomendable crear un proyecto y dentro de ese proyecto sus credenciales de acceso. Nmralmente todos los sistemas de cloud publica utilizan cuentas de servicio, las cuales son accesibles via API y a  su vez administradas a travez de IAM (Infraestructure Access Managment) que poseen todas las nubes.

Por tanto al trabajar con un "Cliente" en particular se sugiere seguir el siguiente esquema:

 .Project:    POC-Cliente 
 .IAM:        pocClienteServiceAccount@google...

### Creacion de projecto para POC.

### Creacion de cuenta de servicio en Google Cloud.