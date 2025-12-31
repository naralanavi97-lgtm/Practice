variable "vpc_name" {
  description = "myvpc"
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
