########################################
# PROVIDER CONFIGURATION
########################################
provider "google" {
  # GCP project ID where resources will be created
  project = var.project_id

  # Default region for resources
  region = var.region

  # Default zone for Compute Engine
  zone        = var.zone
  # Use a service account JSON for Application Default Credentials
  credentials = file("/workspaces/Practice/gcp/keys.json")
}
########################################
# VPC MODULE CALL
########################################
module "vpc" {
  # Path to the VPC module
  source = "./modules/vpc"
  # Input variables passed to the VPC module
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  region      = var.region
}

########################################
# VM MODULE CALL
########################################
module "vm" {
  # Path to the VM module
  source = "./modules/vm"

  # VM configuration
  vm_name      = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone
  subnet_id    = module.vpc.subnet_id
}
