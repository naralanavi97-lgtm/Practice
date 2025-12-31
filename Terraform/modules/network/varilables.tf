variable "vpc_name" {
  description = "myvpc"
    type        = string
}
variable "subnet_name_1" {
  description = "subnet1"
    type        = string
}
variable "subnet_name_2" {
  description = "subnet2"
    type        = string
}
variable "region" {
    description = "asia-south1 (Mumbai)"
        type        = string    
}
variable "subnet1_cidr" {
  description = "cidr for subnet1"
    type        = string
}
variable "subnet2_cidr" {
    description = "cidr for subnet2"
        type        = string
}
