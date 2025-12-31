# Configure GCP provider
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# -------------------------------
# NETWORK MODULES
# -------------------------------

# Subnet 1
module "network_subnet1" {
  source = "./modules/network"
}

# Subnet 2
module "network_subnet2" {
  source = "./modules/network"

}

# -------------------------------
# COMPUTE MODULES
# -------------------------------

# VM in Subnet 1
module "compute_vm1" {
  source = "./modules/compute"

  instance_name = var.instance_name
  machine_type  = var.machine_type
  zone          = var.zone
  disk_image    = var.disk_image
  disk_size     = var.disk_size

  subnet = module.network_subnet1.subnet_id
}

# VM in Subnet 2
module "compute_vm2" {
  source = "./modules/compute"

  instance_name = var.instance_name2
  machine_type  = var.machine_type
  zone          = var.zone
  disk_image    = var.disk_image
  disk_size     = var.disk_size

  subnet = module.network_subnet2.subnet_id
}

# -------------------------------
# FIREWALL RULE (Optional)
# -------------------------------

resource "google_compute_firewall" "allow_ssh" {
  name    = var.firewall_name
  network = var.vpc_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
}