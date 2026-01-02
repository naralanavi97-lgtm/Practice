terraform {
  backend "gcs" {
    bucket  = "demo-bucketcreation"
    prefix  = "/Modules/storage.tf/terraform-state"
  }
}