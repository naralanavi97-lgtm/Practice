terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.14.1"
    }
  }
}

provider "google" {
  project     = "august-list-482711-p6"
  region      = "asia-south1"
  zone        = "asia-south1-a"
  credentials = "./keys.json"
}