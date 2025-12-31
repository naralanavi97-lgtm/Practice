variable "instance_name" {
  description = "my_vm"
  type = string
}
variable "machine_type" {
  description = "e2-medium"
  type = string
}
variable "zone" {
  description = "asia-south1-a"
  type = string
}
variable "region" {
  description = "asia-south1 (Mumbai)"
  type = string
}
variable "disk_image" {
  type    = string
  default = "debian-cloud/debian-11"
}

variable "disk_size" {
  type    = number
  default = 10
}

variable "network" {
  description = "default"
  type        = string
  default     = "default"
}
