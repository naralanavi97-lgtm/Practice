variable "instance_name" {
  description = "Name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "GCE machine type"
  type        = string
}

variable "zone" {
  description = "Zone where the VM will be created"
  type        = string
}

variable "disk_image" {
  description = "Boot disk image"
  type        = string
}

variable "disk_size" {
  description = "Boot disk size in GB"
  type        = number
}

variable "subnet" {
  description = "Subnetwork self-link or name"
  type        = string
}