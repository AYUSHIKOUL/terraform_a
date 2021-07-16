variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "vpc_name" {
    default = "terraform_vpc"
}

variable "vpc_id" {}

variable "subnet_cidr" {
    default = "10.0.0.0/24"
}

variable "availability_zone" {
    default = "ap-south-1b"
}

variable "subnet_name" {
    default = "terraform-subnet-demo"
}

variable "igw_name" {
    default = "terraform_igw"
}

variable "subnet_id" {}

variable "igw_id" {}

variable "route_table_name" {
    default = "terraform_rout_table"
}

variable "route_table_id" {}