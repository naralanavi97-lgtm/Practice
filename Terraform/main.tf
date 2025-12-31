terraform {
    required_version = ">= 0.12"
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone    
}

module "VM" {
  source = "./modules/VM"
  instance_name = "my_vm"
  machine_type = "e2-medium"
  zone = var.zone
  region = var.region
  disk_image = var.image
}

module "VPC" {
  source = "./modules/VPC"
  vpc_name = 
  subnet1_name = var.subnet1_name
  subnet2_name = var.subnet2_name
  region = var.region
  subnet1_cidr = var.subnet1_cidr
  subnet2_cidr = var.subnet2_cidr
  firewall_name = var.firewall_name
}