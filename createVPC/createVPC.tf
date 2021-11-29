# Terraform creacion de VPC
#
# Obejtivo: El siguiente script crea 1 VPC con dos subredes. Y reglas basicas de firewall para cada una de ellas.
#


## Configuracion del proyecto
provider "google" {
  project = "poc-centerhorses"
  region  = "southamerica-west1"
  zone    = "southamerica-west1-a"
}

######################################################################################################
######################################################################################################

## VPC Red1
# https://www.terraform.io/docs/providers/google/r/compute_network.html#example-usage-network-basic

resource "google_compute_network" "red1" {
  name                    = "red1"
  auto_create_subnetworks = false
}

# MGMT Subnet
# https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html

resource "google_compute_subnetwork" "mgmt" {
  name          = "mgmt"
  ip_cidr_range = "10.0.0.0/24"
  region        = "southamerica-west1"
  network       = google_compute_network.red1.id
}

######################################################################################################
######################################################################################################

## VPC Red2
# https://www.terraform.io/docs/providers/google/r/compute_network.html#example-usage-network-basic

resource "google_compute_network" "red2" {
  name                    = "red2"
  auto_create_subnetworks = false
}

# Service Subnet
# https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html

resource "google_compute_subnetwork" "service" {
  name          = "service"
  ip_cidr_range = "192.168.0.0/24"
  region        = "southamerica-west1"
  network       = google_compute_network.red2.id
}

######################################################################################################
#####################################################################################################

## Regalas de Firewall

#resource "google_compute_firewall" "red1" {
#  name    = "red1"
#  project = "poc-centerhorses"
#  network = google_compute_network.red1.id

#  allow {
#    protocol = "icmp"
#  }

#  allow {
#    protocol = "tcp"
#    ports    = ["22"]
#  }
#  source_ranges = ["0.0.0.0/0"]
#  #destination_ranges = ["0.0.0.0/0"]
#}

#resource "google_compute_firewall" "red2" {
#  name    = "red2"
#  project = "poc-centerhorses"
#  network = google_compute_network.red2.id

#  allow {
#    protocol = "icmp"
#  }

#  allow {
#    protocol = "tcp"
#    ports    = ["22"]
#  }
#  source_ranges = ["0.0.0.0/0"]
#}