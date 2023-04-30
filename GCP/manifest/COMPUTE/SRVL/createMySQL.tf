resource "google_sql_database_instance" "dbmysql" {
  name = "db-${var.gcpProjectId}"
  database_version = "MYSQL_5_7"

  settings{
    tier = "db-f1-micro"
     user_labels = {
      "environment" = "development"
    }
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.dev.id
    }
    maintenance_window {
      day  = "1"
      hour = "4"
    }
    backup_configuration {
      enabled = true
      start_time = "04:30"
    } 
  }
}
resource "google_sql_user" "users" {
  name     = "peron"
  instance = google_sql_database_instance.dbmysql.name
  password = "n0T1ad0y"
}
resource "google_sql_database" "database" {
  name     = "db-${var.gcpProjectId}"
  instance = google_sql_database_instance.dbmysql.name
}