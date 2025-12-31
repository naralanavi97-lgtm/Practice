########################################
# COMPUTE ENGINE VM
########################################
resource "google_compute_instance" "vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  ######################################
  # BOOT DISK
  ######################################
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 10 # disk size in GB
    }
  }

  ######################################
  # NETWORK INTERFACE
  ######################################
  network_interface {
    subnetwork = var.subnet_id

    # Assign public IP
    access_config {}
  }

  ######################################
  # METADATA
  ######################################
  metadata = {
    enable-oslogin = "TRUE"
  }

  ######################################
  # NETWORK TAGS
  ######################################
  tags = ["ssh"]
}