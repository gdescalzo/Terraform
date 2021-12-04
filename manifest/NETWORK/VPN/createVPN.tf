
resource "google_compute_instance" "vpn" {
  name         = "vpn-${var.gcpProjectId}"
  machine_type = "e2-micro"
  zone         = "southamerica-west1-a"

  tags = ["vpn", "${var.gcpProjectId}"]

  boot_disk {
    initialize_params {
      #image = "debian-cloud/debian-9"
      #image = "openvpn-access-server-200800/openvpn-access-server"
      image = "https://www.googleapis.com/compute/v1/projects/openvpn-access-server-200800/global/images/aspub275"
      size = "10"
      #type = "local-ssd"
    }
  }

  network_interface {
    network = "dev"
    subnetwork = "dev"

    access_config {
      // Ephemeral public IP
    }
  }
}