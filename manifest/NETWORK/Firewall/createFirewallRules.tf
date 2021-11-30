## PRD Firewall Rules
resource "google_compute_firewall "prd" {
  name    = "prd-firewall"
  network = google_compute_network.prd.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}

## QAT Firewall Rules
resource "google_compute_firewall "qat" {
  name    = "qat-firewall"
  network = google_compute_network.qat.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}

## DEV Firewall Rules
resource "google_compute_firewall "dev" {
  name    = "dev-firewall"
  network = google_compute_network.dev.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}