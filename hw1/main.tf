provider "aws" { }

data "aws_vpc" "cdp_vpc" {
  id = "${var.vpc_id}"
}

resource "aws_launch_configuration" "cdp_lc" {
    name            = "${var.name_prefix}-lc"
    image_id        = "${var.ami_id}"
    instance_type   = "${var.instance_type}"
    key_name        = "${var.key_name}"

    associate_public_ip_address = true
    security_groups = ["${aws_security_group.cdp_sg.id}"]

    user_data = "${data.template_file.user_data.rendered}"
}

resource "aws_autoscaling_group" "cdp_asg" {
    name                        = "${var.name_prefix}-asg"
    min_size                    = "${var.asg_min_size}"
    max_size                    = "${var.asg_max_size}"
    desired_capacity            = "${var.asg_desired_capacity}"

    health_check_type           = "EC2"
    health_check_grace_period   = 300

    force_delete                = true

    availability_zones          = "${var.availability_zones}"
    vpc_zone_identifier         = "${var.public_subnet_ids}"
    launch_configuration        = "${aws_launch_configuration.cdp_lc.name}"

    //default_cooldown = 500

    tag {
        key                 = "Name"
        value               = "${var.name_prefix}-cdp-asg"
        propagate_at_launch = true 
    }

}

resource "aws_security_group" "cdp_sg" {
    name        = "${var.name_prefix}-sg-home"
    description = "SG for access from home"
    vpc_id      = "${data.aws_vpc.cdp_vpc.id}" 

    tags {
        Name = "${var.name_prefix}-sg-home"
    }
}

resource "aws_security_group_rule" "allow_http_ingress" {
    type = "ingress"

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    security_group_id   = "${aws_security_group.cdp_sg.id}"
    cidr_blocks         = "${var.allowed_cidrs}"
}

resource "aws_security_group_rule" "allow_ssh_ingress" {
    type = "ingress"

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    security_group_id   = "${aws_security_group.cdp_sg.id}"
    cidr_blocks         = "${var.allowed_cidrs}"
}

resource "aws_security_group_rule" "allow_all_egress" {
    type = "egress"

    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    security_group_id   = "${aws_security_group.cdp_sg.id}"
    cidr_blocks         = ["0.0.0.0/0"]
}

data "template_file" "user_data" {
    template = "${file("user_data.sh")}"
}