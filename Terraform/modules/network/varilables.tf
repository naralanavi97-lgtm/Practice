variable "vpc_name" {
  description = "create vpc"
    type        = string
}
variable "subnet_name_1" {
  description = "subnet1"
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