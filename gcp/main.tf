resource "google_compute_network" "vpc_name" {
  name                    = "test-naveen-vpc"
  auto_create_subnetworks = false #disable automatic subnet creation
  mtu                     = 1460  #optional

}

resource "google_compute_subnetwork" "subnet_name" {
  name          = "test-naveen-subnet1"
  ip_cidr_range = "10.2.0.0/16"                      #specify the IP range
  region        = "asia-south1"                      #specify the region
  network       = google_compute_network.vpc_name.id #which VPC to attach
}

resource "google_compute_subnetwork" "subnet_name2" {
  name          = "test-naveen-subnet2"
  ip_cidr_range = "10.3.0.0/16"                      #specify the IP range
  region        = "asia-south1"                      #specify the region
  network       = google_compute_network.vpc_name.id #which VPC to attach
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = "test-private-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "asia-south1"
  network       = google_compute_network.vpc_name.id

}


resource "google_compute_instance" "vm_name" {
  name         = "test-naveen-vm"
  machine_type = "e2-micro"
  zone         = "asia-south1-a"
  # Boot disk
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 10
    }
  }

  # Attach to the private subnetwork. Omitting `access_config` keeps
  # the instance without an external IP (private-only).
  network_interface {
    subnetwork = google_compute_subnetwork.private_subnet.id
  }

}

