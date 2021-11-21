# Terraform creacion de VPC


## Configuracion del proyecto
provider "google" {
  project = "poc-centerhorses"
  region  = "southamerica-west1"
  zone    = "southamerica-west1-a"
  credentials = file"./vars/poc-terraform.json"
}

# Red1 VPC
# https://www.terraform.io/docs/providers/google/r/compute_network.html#example-usage-network-basic
resource "google_compute_network" "red1" {
  name                    = "red1"
  auto_create_subnetworks = false
}