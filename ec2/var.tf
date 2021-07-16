variable "ami_id" {
    default = "ami-0c1a7f89451184c8b"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "key_name" {
    default = "error"
}

variable "subnet_id" {}

variable "security_group" {}

variable "name_tag" {
    default = "demoforterraformec2"
}