resource "google_compute_network" "vpc_name" {
  name =var.vpc_name    
    auto_create_subnetworks = false 
}
resource "google_compute_subnetwork" "subnet_name_1" {
  name          = var.subnet_name_1
    region        = var.region
      ip_cidr_range = var.subnet1_cidr
        network       = google_compute_network.vpc_name.id
}