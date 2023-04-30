variable "gcpProjectId" {}
variable "gcpAppPwd" {}
variable "gcpRegion" {}
variable "gcpZone" {}

provider "google" {
    credentials = file("${var.gcpAppPwd}")
    region = "southamerica-west1"
    zone = "southamerica-west1-a"
    project = "${var.gcpProjectId}"
}