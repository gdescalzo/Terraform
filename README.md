# Terraform-gcp

Repositorio de Terraform , para despliegues en GCP.
## Requisitos para utilizar este codigo:

Para utilizar el siguiente codigo debemos, cumplir con ciertos requisitos a fin de garantizar conectividad segura entre GCP y nuestro "Terraform Server".
## Algunas consideraciones.

Para toda POC o Proyecto definitivo es recomendable crear: 

1. Su propio <strong>Teannt</strong> , el cual GCP lo llama "<strong>Project</strong>" o "<strong>Proyecto</strong>".
2. Dentro del mismo, sus credenciales de acceso mediante la asignacion de un "<strong>Service Account</strong>" o "<strong>Cuenta de Servicio</strong>".

Noralmente todos los sistemas de cloud publica, utilizan cuentas de servicio, las cuales son accesibles via API. A su vez son administradas a travez de <strong>IAM</strong> (Infraestructure Access Managment) que poseen todas las nubes.

Por tanto, al trabajar con un "Cliente" en particular se sugiere seguir el siguiente esquema:

- <strong>Project</strong>: POC-Cliente
- <strong>IAM</strong>: pocClienteServiceAccount@google...
    - <strong>Role</strong>: cloud.admin 

### Proyecto

A continuacion se explicaran los pasos para crear un projecto en GCP:


1.  Loguearse como <strong>Tenant Admin</strong>:</br>
    Utilizando el siguiente comando: <strong>gcloud auth login</strong>:

            [root@gsv-gastion terraform-gcp]# gcloud auth login
            Go to the following link in your browser:

            https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=32555940559.apps.googleusercontent.com&redirect_uri=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob&scope=openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcloud-platform+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fappengine.admin+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcompute+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Faccounts.reauth&state=G5DH6m8UVpzjKFZglcilP1rLWDNdpq&prompt=consent&access_type=offline&code_challenge=E9mgWROHK-dwfHP8KF2Jf7Aesi0WkZAIQ3Wfb9PyEBk&code_challenge_method=S256

            Enter verification code: 4/1AX4XfWgygUZ6DtbL2LC8pQFpft9djh9CivhRJVHPUeVV0I7-Z16EQ4nDwcY

            You are now logged in as [gdescalzo11@gmail.com].
            Your current project is [gsventerprise].  You can change this setting by running:
            $ gcloud config set project PROJECT_ID
            [root@gsv-gastion terraform-gcp]# 

2.  Creamos el proyecto:
    Utilizando el siguiente comando: <strong>gcloud projects create --name poc-CenterHorses poc-centerhorses</strong></br>

    <strong>Aclaracion</strong>:</br>
    * <strong>--name poc-CenterHorses</strong> <-- es el nombre del proyecto
    * <strong>pocceterhorses</strong> -- es el ID del proyecto (el cual siempre debe ir en minuscula).

            [root@gsv-gastion terraform-gcp]# gcloud projects create --name poc-CenterHorses poc-centerhorses
            
            Create in progress for [https://cloudresourcemanager.googleapis.com/v1/projects/poc-centerhorses].
            Waiting for [operations/cp.5938497902378632191] to finish...done.

            Enabling service [cloudapis.googleapis.com] on project [poc-centerhorses]...
            Operation "operations/acf.p2-853615149116-aee4e35c-2de2-4b29-8ee1-e2e6c4eeb42f" finished successfully.
            [root@gsv-gastion terraform-gcp]#


3.  Seleccionamos el proyecto:</br>
    Utilizando el siguiente comando: <strong>gcloud config set project poc-centerhorses</strong>

            [root@gsv-gastion terraform-gcp]# gcloud config set project poc-centerhorses
            Updated property [core/project].
            [root@gsv-gastion terraform-gcp]# 

### Cuenta de Servicio

1.  Creamos la Cuenta de Servicio</br>
    Utilizaremos el siguiente comando: "<strong>gcloud iam service-accounts create poc-terraform --display-name="poc-terraform"</strong>"

            [root@gsv-gastion terraform-gcp]# gcloud iam service-accounts create poc-terraform --display-name="poc-terraform"
            Created service account [poc-terraform].
            [root@gsv-gastion terraform-gcp]# 

2.  Asignamos un "<strong>role</strong>" de operacion para la Cuenta de Servicio Creada</br>
    Utilizaremos el siguiente comando: 
    
            gcloud projects add-iam-policy-binding poc-centerhorses \
            --member="serviceAccount:poc-terraform@poc-centerhorses.iam.gserviceaccount.com" \
            --role="roles/iam.serviceAccountAdmin"
<strong>Aclaracion</strong>: 
* <strong>add-iam-policy-binding</strong>: es el "flag" que asigna el "role" a la cuenta de servicio.
* <strong>PROJECT_IS</strong>: en este caso el project_id es "<strong>poc-centerhorses</strong>" (puede obtenerse con el comnado: <strong>gcloud projects list</strong>)
* <strong>--member=...</strong>: esta es la cuenta de servicio (puede obtenerse con el comando: <strong>gcloud iam service-accounts list</strong>)
* <strong>--role=...</strong>: este es el role (permisos que se le asignaran a la cuenta de servicio creada. Puede obtenerse con el comando <strong>gcloud iam roles list| more</strong>) 

            [root@gsv-gastion terraform-gcp]# gcloud projects add-iam-policy-binding poc-centerhorses \
             --member="serviceAccount:poc-terraform@poc-centerhorses.iam.gserviceaccount.com" \
            > --role="roles/iam.serviceAccountAdmin"
            Updated IAM policy for project [poc-centerhorses].
            bindings:
            - members:
            - serviceAccount:poc-terraform@poc-centerhorses.iam.gserviceaccount.com
            role: roles/iam.serviceAccountAdmin
            - members:
            - user:gdescalzo11@gmail.com
            role: roles/owner
            etag: BwXRUhXRFr0=
            version: 1
            [root@gsv-gastion terraform-gcp]# 

