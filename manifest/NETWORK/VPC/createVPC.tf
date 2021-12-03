# Terraform creacion de VPC
#
# Obejtivo: El siguiente script crea 1 VPC con dos subredes.
#

## VPC PRD
# https://www.terraform.io/docs/providers/google/r/compute_network.html#example-usage-network-basic

resource "google_compute_network" "prd" {
  name                    = "prd"
  auto_create_subnetworks = false
}

# PRD Subnet
# https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html

resource "google_compute_subnetwork" "prd" {
  name          = "prd"
  ip_cidr_range = "10.166.3.0/24"
  region        = "southamerica-west1"
  network       = google_compute_network.prd.id
}

######################################################################################################
######################################################################################################

## VPC QAT
# https://www.terraform.io/docs/providers/google/r/compute_network.html#example-usage-network-basic

resource "google_compute_network" "qat" {
  name                    = "qat"
  auto_create_subnetworks = false
}

# QAT Subnet
# https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html

resource "google_compute_subnetwork" "qat" {
  name          = "qat"
  ip_cidr_range = "10.166.30.0/24"
  region        = "southamerica-west1"
  network       = google_compute_network.qat.id
}

######################################################################################################
######################################################################################################

## VPC DEV
# https://www.terraform.io/docs/providers/google/r/compute_network.html#example-usage-network-basic

resource "google_compute_network" "dev" {
  name                    = "dev"
  auto_create_subnetworks = false
}

# DEV Subnet
# https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html

resource "google_compute_subnetwork" "dev" {
  name          = "dev"
  ip_cidr_range = "10.166.33.0/24"
  region        = "southamerica-west1"
  network       = google_compute_network.dev.id
}