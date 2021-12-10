
resource "google_compute_instance" "vpn" {
  name         = "vpn-${var.gcpProjectId}"
  machine_type = "e2-micro"
  zone         = "${var.gcpZone}"

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

#metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

  network_interface {
    network = "dev"
    subnetwork = "dev"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }
}