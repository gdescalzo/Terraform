


resource "google_sql_database_instance" "master" {
  name             = "db-${var.gcpProjectId}"
  database_version = "POSTGRES_11"
  region           = "${var.gcpRegion}"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"

    
  }
}