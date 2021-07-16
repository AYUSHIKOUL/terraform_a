resource "aws_instance" "demoterraformec2" {
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    subnet_id = "${var.subnet_id}"
    security_groups = ["${var.security_group}"]
    tags = {
      "Name" = "${var.name_tag}"
    }
}