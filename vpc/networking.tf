resource "aws_vpc" "terraform_vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    
    tags = {
        Name = "${var.vpc_name}"
    }
}

resource "aws_subnet" "terraform_subnet_1" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.subnet_cidr}"
    map_public_ip_on_launch = "true"
    availability_zone = "${var.availability_zone}"
    tags = {
        Name = "${var.subnet_name}"
    }
}

resource "aws_internet_gateway" "terraform_igw" {
    vpc_id = "${var.vpc_id}"
    tags = {
        Name = "${var.igw_name}"
    }
}

resource "aws_route_table" "terraform_rt" {
    vpc_id = "${var.vpc_id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${var.igw_id}"
    }
    tags = {
        Name = "${var.route_table_name}"
    }
}

resource "aws_route_table_association" "association" {
    subnet_id = "${var.subnet_id}"
    route_table_id = "${var.route_table_id}"
}

resource "aws_security_group" "terraform_sg" {
    vpc_id = "${var.vpc_id}"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "vpc_id" {
    value = "${aws_vpc.terraform_vpc.id}"
}

output "subnet_id" {
    value = "${aws_subnet.terraform_subnet_1.id}"
}

output "igw_id" {
    value = "${aws_internet_gateway.terraform_igw.id}"
}

output "route_table_id" {
    value = "${aws_route_table.terraform_rt.id}"
}

output "security_group_id" {
    value = "${aws_security_group.terraform_sg.id}"
}