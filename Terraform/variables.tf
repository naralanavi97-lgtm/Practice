# GCP Project details
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type        = string
}

# VPC & Subnets
variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "subnet_name_1" {
  description = "First subnet name"
  type        = string
}


variable "subnet1_cidr" {
  description = "CIDR for first subnet"
  type        = string
}
# VM details
variable "instance_name" {
  description = "First VM name"
  type        = string
}

variable "machine_type" {
  description = "Machine type for VM"
  type        = string
}

variable "disk_image" {
  description = "Boot disk image"
  type        = string
}

variable "disk_size" {
  description = "Boot disk size (GB)"
  type        = number
}

# Firewall
variable "firewall_name" {
  description = "Firewall rule name"
  type        = string
}
