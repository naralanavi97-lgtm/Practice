terraform {
    required_version = ">= 0.12"
}

provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone

  credentials = file("C:/Terraform/august-list-482711-p6-8f4f4f5f1f7e.json")
}