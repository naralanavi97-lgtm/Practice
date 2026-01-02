
########################################
# CREATE VPC NETWORK
########################################
resource "google_compute_network" "vpc" {
  name = var.vpc_name

  # Disable default subnet creation
  auto_create_subnetworks = false
}

########################################
# CREATE SUBNET
########################################
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  region        = var.region

  # Attach subnet to VPC
  network       = google_compute_network.vpc.id

  # IP range
  ip_cidr_range = var.subnet_cidr
}
########################################
# FIREWALL RULE – ALLOW SSH
########################################
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc.name

  # Allow SSH traffic
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Allow from anywhere (can restrict later)
  source_ranges = ["0.0.0.0/0"]

  # Apply to VM with tag "ssh"
  target_tags = ["ssh"]
}
