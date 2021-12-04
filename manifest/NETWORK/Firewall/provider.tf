variable "gcpProjectId" {}
variable "gcpAppPwd" {}

provider "google" {
    credentials = file("${var.gcpAppPwd}")
    region = "southamerica-west1"
    zone = "southamerica-west1-a"
    project = "${var.gcpProjectId}"
}