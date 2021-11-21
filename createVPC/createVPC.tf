# Terraform creacion de VPC

## Configuracion del proyecto
provider "google" {
  project = "poc-centerhorses"
  region  = "southamerica-west1"
  zone    = "southamerica-west1-a"
  
}

# VPC Red1
# https://www.terraform.io/docs/providers/google/r/compute_network.html#example-usage-network-basic

resource "google_compute_network" "red1" {
  name                    = "red1"
  auto_create_subnetworks = false
}

# Public Subnet
# https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html

resource "google_compute_subnetwork" "public" {
  name          = "public"
  ip_cidr_range = "10.0.0.0/24"
  region        = "southamerica-west1"
  network       = google_compute_network.red1.id
}

# VPC Red2
# https://www.terraform.io/docs/providers/google/r/compute_network.html#example-usage-network-basic

resource "google_compute_network" "red2" {
  name                    = "red2"
  auto_create_subnetworks = false
}

# Public Subnet
# https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html

resource "google_compute_subnetwork" "private" {
  name          = "private"
  ip_cidr_range = "192.168.0.0/24"
  region        = "southamerica-west1"
  network       = google_compute_network.red2.id
}