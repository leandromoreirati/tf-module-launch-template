locals {
    files_list = [
        "${md5(file("${path.module}/main.tf"))}",
        "${md5(file("${path.module}/output.tf"))}",
        "${md5(file("${path.module}/variables.tf"))}",
    ]
    current_deployment = "${join("", local.files_list)}"
}

resource "aws_launch_template" "launch_template" {
  name                   = "${var.name}"
  image_id               = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  description            = "Terraform module Launch Template to configuring Spot instances."

  iam_instance_profile {
    name = "${aws_iam_instance_profile.instance_profile.name}"
  }

  block_device_mappings {
    device_name = "${var.device_name}"

    ebs {
      volume_size = "${var.volume_size}"
      volume_type = "${var.volume_type}"
      delete_on_termination = "${var.delete_on_termination}"
    }
  }
  
  /* vpc_security_group_ids = ["${aws_security_group.security_group.id}"] */

  network_interfaces {    
    subnet_id = "${var.private_subnet}"
    security_groups = [
                       "${var.security_groups_id}"
                      ]
    associate_public_ip_address = "${var.public_ip_association}"
    delete_on_termination = "${var.delete_on_termination}"
  }

  monitoring {
    enabled = "${var.monitoring}"
  }

  placement {
    availability_zone = "${var.azs}"
    tenancy           = "${var.tenancy}"
  }
  
/*   instance_market_options {
    market_type = "spot"
  } */

  lifecycle {
    create_before_destroy = true
  }
  
  tag_specifications {
    resource_type = "${var.resource_type}" 
    tags = "${var.tags}"

  }

  tags = "${var.tags}"
}