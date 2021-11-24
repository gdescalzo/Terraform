resource "google_compute_firewall" "MGMT" {
  name    = "test-firewall"
  network = google_compute_network.mgmt.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}

resource "google_compute_network" "MGMT" {
  name = "test-network"
}