resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.disk_image
      size  = var.disk_size
    }
  }

  network_interface {
    subnetwork = var.subnet
    access_config {}
  }

  labels = {
    env = "dev"
    app = "terraform"
  }
}