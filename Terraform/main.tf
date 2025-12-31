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
  source      = "./modules/network"
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name_1
  subnet_cidr = var.subnet1_cidr
  region      = var.region
}

# Subnet 2
module "network_subnet2" {
  source      = "./modules/network"
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name_2
  subnet_cidr = var.subnet2_cidr
  region      = var.region
}

# -------------------------------
# COMPUTE MODULES
# -------------------------------

# VM in Subnet 1
module "network_subnet1" {
  source      = "./modules/network"
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name_1
  subnet_cidr = var.subnet1_cidr
  region      = var.region
}

# VM in Subnet 2
module "network_subnet2" {
  source      = "./modules/network"
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name_2
  subnet_cidr = var.subnet2_cidr
  region      = var.region
}


# -------------------------------
# FIREWALL RULE
# -------------------------------

resource "google_compute_firewall" "allow_ssh" {
  name    = var.firewall_name
  network = module.network_subnet1.vpc_id # reference created VPC

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
}
