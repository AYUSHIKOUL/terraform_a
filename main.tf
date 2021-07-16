provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.region}"
}

module "vpc" {
    source = "/home/ayushi/Desktop/modules/vpc"
    vpc_id = "${module.vpc.vpc_id}"
    subnet_id = "${module.vpc.subnet_id}"
    igw_id = "${module.vpc.igw_id}"
    route_table_id = "${module.vpc.route_table_id}"
}

module "s3" {
    source = "/home/ayushi/Desktop/modules/s3"
    bucket_name = "terraform-demo-bucket-376"
}

module "ec2" {
    source = "/home/ayushi/Desktop/modules/ec2"
    subnet_id = "${module.vpc.subnet_id}"
    security_group = "${module.vpc.security_group_id}"
}
