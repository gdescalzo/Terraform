provider "google" {
    credentials = file("../../../vars/credentials.json")
    region = "southamerica-west1"
    zone = "southamerica-west1-a"  
}