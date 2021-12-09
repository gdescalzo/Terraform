variable "gcpProjectId" {}
variable "gcpAppPwd" {}
variable "gcpSAdisplayName" {}
variable "gcpSAid" {}
variable "gcpRegion" {}
variable "gcpZone" {}

provider "google" {
    credentials = file("${var.gcpAppPwd}")
    region = "${var.gcpRegion}"
    zone = "${var.gcpZone}"
    project = "${var.gcpProjectId}"
}