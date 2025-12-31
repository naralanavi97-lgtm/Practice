// ...existing code...
resource "google_compute_network" "vpc_name" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet1_name" {
  name          = var.subnet1_name
  region        = var.region
  ip_cidr_range = var.subnet1_cidr
  network       = google_compute_network.vpc_name.id
}

resource "google_compute_subnetwork" "subnet2_name" {
  name          = var.subnet2_name
  region        = var.region
  ip_cidr_range = var.subnet2_cidr
  network       = google_compute_network.vpc_name.id
}

resource "google_compute_firewall" "firewall_name" {
  name    = var.firewall_name
  network = google_compute_network.vpc_name.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "instance_name" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 10
    }
  }

  network_interface {
    network    = google_compute_network.vpc_name.id
    subnetwork = google_compute_subnetwork.subnet1_name.id
    access_config {}
  }
}

resource "google_compute_instance" "instance_name_2" {
  name         = "${var.instance_name}-2"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 10
    }
  }

  network_interface {
    network    = google_compute_network.vpc_name.id
    subnetwork = google_compute_subnetwork.subnet2_name.id
    access_config {}
  }
}
// ...existing code...