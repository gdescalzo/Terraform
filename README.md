# Terraform-gcp

Repositorio de Terraform , para despliegues en GCP.
## Requisitos para utilizar este codigo:

Para utilizar el siguiente codigo debemos, cumplir con ciertos requisitos a fin de garantizar conectividad segura entre GCP y nuestro "Terraform Server".
## Algunas consideraciones.

Es recomendable crear un proyecto y dentro de ese proyecto sus credenciales de acceso. Nmralmente todos los sistemas de cloud publica utilizan cuentas de servicio, las cuales son accesibles via API y a  su vez administradas a travez de IAM (Infraestructure Access Managment) que poseen todas las nubes.

Por tanto al trabajar con un "Cliente" en particular se sugiere seguir el siguiente esquema:

- <strong>Project</strong>: POC-Cliente
- <strong>IAM</strong>:      pocClienteServiceAccount@google...

### 1. Creacion de Proyecto

1.  Loguearse como <strong>Tenant Admin</strong>:
    Utilizando el siguiente comando: <strong>gcloud auth login</strong>:

            [root@gsv-gastion terraform-gcp]# gcloud auth login
            Go to the following link in your browser:

            https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=32555940559.apps.googleusercontent.com&redirect_uri=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob&scope=openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcloud-platform+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fappengine.admin+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcompute+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Faccounts.reauth&state=G5DH6m8UVpzjKFZglcilP1rLWDNdpq&prompt=consent&access_type=offline&code_challenge=E9mgWROHK-dwfHP8KF2Jf7Aesi0WkZAIQ3Wfb9PyEBk&code_challenge_method=S256

            Enter verification code: 4/1AX4XfWgygUZ6DtbL2LC8pQFpft9djh9CivhRJVHPUeVV0I7-Z16EQ4nDwcY

            You are now logged in as [gdescalzo11@gmail.com].
            Your current project is [gsventerprise].  You can change this setting by running:
            $ gcloud config set project PROJECT_ID
            [root@gsv-gastion terraform-gcp]# 

### 2. Creacion Cuenta de Servicio