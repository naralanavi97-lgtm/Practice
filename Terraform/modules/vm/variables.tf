
variable "vm_name" {
  description = "VM name"
  type        = string
}

variable "machine_type" {
  description = "VM machine type"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID from VPC module"
  type        = string
}
