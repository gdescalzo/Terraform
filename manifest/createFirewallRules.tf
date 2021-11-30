## PRD Firewall Rules
resource "google_compute_firewall "PRD" {
  name    = "dev-firewall"
  network = google_compute_network.prd.id

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
resource "google_compute_firewall "QAT" {
  name    = "dev-firewall"
  network = google_compute_network.qat.id

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
resource "google_compute_firewall "DEV" {
  name    = "dev-firewall"
  network = google_compute_network.dev.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}