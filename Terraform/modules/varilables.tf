variable "vpc_name" {
  description = "my vpc"
    type        = string

}

variable "subnet1_name" {
  description = "subnet1"
    type        = string

}
variable "subnet2_name" {
  description = "subnet2"
    type        = string

}
variable "region" {

    description = "asia-south1 (Mumbai)"
        type        = string
    
}
variable "subnet1_cidr" {
  description = "10.0.1.0/24"
    type        = string

}
variable "subnet2_cidr" {
  description = "10.0.2.0/24"
    type        = string
}

variable "firewall_name" {
  description = "firewall name"
    type        = string

}

variable "instance_name" {
    description = "naveen_vm"
        type        = string        
}
variable "instance_name2" {
    description = "naveen_vm2"
        type        = string        
}
variable "machine_type" {
    description = "e2-medium"
        type        = string        
}
variable "zone" {
    description = "asia-south1-a"
        type        = string        
}   

  