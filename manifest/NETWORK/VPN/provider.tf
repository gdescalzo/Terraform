variable "gcpProjectId" {}
variable "gcpAppPwd" {}
variable "gcpSAdisplayName" {}
variable "gcpSAid" {}

provider "google" {
    credentials = file("${var.gcpAppPwd}")
    region = "southamerica-west1"
    zone = "southamerica-west1-a"
    project = "${var.gcpProjectId}"
}