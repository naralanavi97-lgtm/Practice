resource "google_compute_network" "vpc_name" {
  name =var.vpc_name    
    auto_create_subnetworks = false 
}
resource "google_compute_subnetwork" "subnet1_name" {
  name          = var.subnet1_name
    region        = var.region
      ip_cidr_range = var.subnet1_cidr
        network       = google_compute_network.vpc_name.id
}
resource "google_compute_subnetwork" "subnet2_name" {
  name          = var.subnet2_name
    region        = var.region
      ip_cidr_range = var.subnet2_cidr
        network       = google_compute_network.vpc_name.id
}