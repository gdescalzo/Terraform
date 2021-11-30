provider "google" {
    credentials = file("../../../vars/crentials.json")
    region = "southamerica-west1"
    zone = "southamerica-west1-a"  
}