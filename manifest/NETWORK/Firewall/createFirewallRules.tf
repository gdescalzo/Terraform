## PRD Firewall Rules
resource "google_compute_firewall" "prd" {
  project     = var.gcpProjectId
  name        = "prd"
  network     = "prd"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }
  source_ranges = ["0.0.0.0/0"]
}

## QAT Firewall Rules
resource "google_compute_firewall" "qat" {
  project     = var.gcpProjectId
  name        = "qat"
  network     = "qat"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }
  source_ranges = ["0.0.0.0/0"]  

}
## DEV Firewall Rules
resource "google_compute_firewall" "dev" {
  project     = var.gcpProjectId
  name        = "dev"
  network     = "dev"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "943", "945", "1194"]

  }
  source_ranges = ["0.0.0.0/0"]
}