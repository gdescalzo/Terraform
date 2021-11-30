provider "google" {
    credentials = file("../vars/crentials.yml")
    region = "southamerica-west1"
    zone = "southamerica-west1-a"  
}