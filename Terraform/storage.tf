terraform {
  backend "gcs" {
    bucket  = "demo-bucketcreation"
    prefix  = "terraform/state"
  }
}
