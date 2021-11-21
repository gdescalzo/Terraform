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

    <strong>A</strong>claracion: 
    * <strong>--name poc-CenterHorses</strong> <-- es el nombre del proyecto
    * <strong>pocceterhorses</strong> -- es el ID del proyecto (el cual siempre debe ir en minuscula).

            [root@gsv-gastion terraform-gcp]# gcloud projects create --name poc-CenterHorses poc-centerhorses
            
            Create in progress for [https://cloudresourcemanager.googleapis.com/v1/projects/poc-centerhorses].
            Waiting for [operations/cp.5938497902378632191] to finish...done.

            Enabling service [cloudapis.googleapis.com] on project [poc-centerhorses]...
            Operation "operations/acf.p2-853615149116-aee4e35c-2de2-4b29-8ee1-e2e6c4eeb42f" finished successfully.
            [root@gsv-gastion terraform-gcp]#


3.  Seleccionamos el Proyecto:</br>
    Utilizando el siguiente comando: <strong>gcloud config set project poc-centerhorses</strong>

            [root@gsv-gastion terraform-gcp]# gcloud config set project poc-centerhorses
            Updated property [core/project].
            [root@gsv-gastion terraform-gcp]# 

4.  Seteamos el la Zona de Computo:</br>
    Utilizando el siguiente comando: <strong>gcloud config set compute/zone southamerica-west1-a</strong>

            [root@gsv-gastion terraform-gcp]# gcloud config set compute/zone southamerica-west1-a
            Updated property [compute/zone].
            API [compute.googleapis.com] not enabled on project [853615149116]. Would you like to enable and retry (this will take a few minutes)? (y/N)?  y

            Enabling service [compute.googleapis.com] on project [853615149116]...
            WARNING: Property validation for compute/zone was skipped.
            [root@gsv-gastion terraform-gcp]# 

5.  Configuramos la Region de Computo:</br>
    Utilizando el siguiente comando: <strong>gcloud config set compute/region southamerica-west1</strong>

            [root@gsv-gastion terraform-gcp]# gcloud config set compute/region southamerica-west1
            Updated property [compute/region].
            API [compute.googleapis.com] not enabled on project [853615149116]. Would you like to enable and retry (this will take a few minutes)? (y/N)?  y

            Enabling service [compute.googleapis.com] on project [853615149116]...
            WARNING: Property validation for compute/region was skipped.
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
<strong>A</strong>claracion: 
* <strong>add-iam-policy-binding</strong>: es el "flag" que asigna el "role" a la cuenta de servicio.
* <strong>PROJECT_IS</strong>: en este caso el project_id es "<strong>poc-centerhorses</strong>" (puede obtenerse con el comnado: "<strong>gcloud projects list</strong>")
* <strong>--member=...</strong>: esta es la cuenta de servicio (puede obtenerse con el comando: "<strong>gcloud iam service-accounts list</strong>")
* <strong>--role=...</strong>: este es el role (permisos que se le asignaran a la cuenta de servicio creada.</br>
                               Puede obtenerse con el comando "<strong>gcloud iam roles list | more</strong>") 

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

## Descargar Service Account Key

Para que Terrafom pueda interactuar con GCP, como ya sabemos necesita una cuenta de servicio.
Asi mismo cada cuenta de servicio puede tener una KEY. Digo puede, ya que hay que generarla y descargarla para que Terraform pueda hacer el "<strong>HandShake</strong>" con GCP. 

Podemos generar la KEY y descargarla con el siguiente comando, es recomendable descargarla en el directorio "<strong>vars</strong">:

                gcloud iam service-accounts keys create ./poc-terraform.json \
                --iam-account poc-terraform@poc-centerhorses.iam.gserviceaccount.com

Vertificamos la descarga (cd vars)

            [root@gsv-gastion vars]# cat poc-terraform.json 
            {
            "type": "service_account",
            "project_id": "poc-centerhorses",
            "private_key_id": "7b51845cb3f369a8b3e34c3a565ef1f9e056116d",
            "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQD36dif/28EB5aW\nEbuxNVKiFfaYa4SYy9EDx+dD5+/JasqJSCVp7XLyrQNbKicQw4hzoLxq7JopOAD1\njdjwzZkTT11bBKlyk9iXETXIuN0JYBQuvLlsEzS5ost/GhaRSAWAWKsLyyUPqwXY\nBImLE8UaHjQbDrRKoZiuZBqtVfU44el8qTspb1jlmjlM55RRb5R1ccrLdFwMaWqO\nBnJ8tO6u+/7A+l5TR4gf5XENNzdxO5JMBUFfjDnGfxvrosi2dmFAmxEKo0M16N2f\n2qhizlfvLF0ZeR55L+6LJFFxG3QVrE9mzcQ2qUq+/STXxdEy+ClabR0oZOuKSfUz\nxzjmVcmrAgMBAAECggEAF7ESUaAAhPsQqgDB1hqJbhH5QfGsd0mrDNhywmuM38vD\n1UC+ypO1k3lzQ6gQmaqGBL7Mos8/oEbI2K6Yl9KeGVlRS5xzcQ6t+Snc4PTBst6q\nrxi8A5cGR+NF3TyqAXJHjE9s8TCVtxyZ713noxHdmTRfuGI8WpF83NWWMxBu4eOM\n3Lkfcipbka/orxqICQWLpkAstDjYQPBJW1F0ETCtBLPzinWrhiBVHwyMzPcnkg79\nC3yMdKKqk0bWZ+IMU3dNVXFmw4yjFEr2rCKKMH9I/RhIkUK0Mi/O5Pf3gokEixey\nlm7XqvPpykSnykf6pq1IRo+8cC27VuSO1yPeJ2tLEQKBgQD945AmxJkEiCXstq8b\n6/lJY5LlcKhIqKpuSt5fgM0xH7ZZr+2ZOhrGUKmS5dfy1pWfLqpcqonVxNfGT5eE\nEcJHIWyZJRk1gwfuxou9AdcPU97Tx33XKrITKb0LNvKlqvI1J1sWGXF4rwVYAEJz\nWBwwuPaEknlxAtj+jNCyTermuQKBgQD5+ZBDojLXKcTOxemy0zAK54gJ1v5qDa6f\nkvPHgKMFZwLtRqDcUtr0w9faVNOy6r2Hwe8wr6ZU4pJg5wfy31VcrTufI31GWrWl\n15U2Dkwexqj8z4nU8WDVGEijsA/pBaIfOrBbOmEIdaWOrHC6+3B40i+OKn5SPd7Y\nqYzPoJMBgwKBgG0cUEYo9W36KPpLJIRGbHL6xRWvzdK0EdKmgFzg2M5Ex7RRpDXW\nv8z8u3OzLZRiXhj0ECkU7XmeR/ElIYOTsj+pgKdsRyI1NsKKN2G6GbevnrK7KDzB\nT5hmtqTML4m9JqxrRnz/4EEyToScT/KMKklSJDejT2efBqyWzdXjIJGZAoGADttF\nNq/SI7WIy905WXZxuYQvMp6Delwbz8IVGPtNNQn9Q4raDp4iA0AMeR5ngo+u+f2N\nsLAPy6W3m2i/sTCSyzJEg93BGUhU2Wlppc/NuFqIOpY/E9fQsHmD/658E5ZRH1gG\nmTVsBOuxDjyzanl9IsEjMGjYHx0sPGY/Ryu88O8CgYEAgcWbs6zSeAlXvRg5eUxV\nLEc9JfnKM3kdp4nzSp+0Nvi/NozD2fIz8onf2zoEgEMfFflOte6rQ1S2q/fnIv+7\n7ahGTqKQIEXiWUwLWYsY5khwm+qBshHqPHMm7xjmTBkN7a4uH103I+Y0eruDaX7O\njuQKlLXVAfDpw+QfRvsyWMQ=\n-----END PRIVATE KEY-----\n",
            "client_email": "poc-terraform@poc-centerhorses.iam.gserviceaccount.com",
            "client_id": "113667255929470238531",
            "auth_uri": "https://accounts.google.com/o/oauth2/auth",
            "token_uri": "https://oauth2.googleapis.com/token",
            "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
            "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/poc-terraform%40poc-centerhorses.iam.gserviceaccount.com"
            }
            [root@gsv-gastion vars]# 
