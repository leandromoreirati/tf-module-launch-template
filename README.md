![alt text](https://www.terraform.io/assets/images/logo-hashicorp-3f10732f.svg)

# **tf-module-launch-template**

Terraform module for creation ***Launch Template***.

**Requirements**
  - Terraform
  - AWS Account
  
**Dependencies**
 - Security Group
 - IAM Role
 - IAM Instance Profile

**Example of Use**
 ------
```
module "launch_template" {
  source = "https://github.com/leandromoreirati/tf-module-launch_template.git"

  name       = "<RESOURCE_NAME>"

  vpc_id                = "${var.vpc_id}"
  azs                   = "${var.azs}"
  private_subnet        = "${var.private_subnet}"
  security_group_id     = "${var.security_group_id}"
  tenancy               = "${var.tenancy}"
  monitoring            = "${var.monitoring}"
  public_ip_association = "${var.public_ip_association}"
  ami                   = "${var.ami}" 
  instance_type         = "${var.instance_type}"
  key_name              = "${var.key_name}"
  volume_size           = "${var.volume_size}"
  volume_type           = "${var.volume_type}"
  device_name           = "${var.device_name}"
  delete_on_termination = "${var.delete_on_termination}"
  resource_type         = "${var.resource_type}"
  security_groups_id    = ["${module.security_group.security_group_id}"]

  tags = {
    "tag01"    = "value01"
    "tag02"    = "value02"
    "tag03"    = "value03"
    "tagN"     = "valueN"
  }

}

```
 **Variables**
 ------
 |         Name         |                            Description                                 |  Default  |
 | -------------------- |------------------------------------------------------------------------|:---------:|
 | vpc_id               | VPC ID                                                                 |    ""     |
 | azs                  | Availability Zones                                                     |    ""     |
 | private_subnet       | Subnets ID                                                             |    ""     |
 | tenancy              | Instance Allocation Type                                               |  default  |
 | monitoring           | Enables instance monitoring                                            |   false   |
 | ami                  | AMI ID                                                                 |    ""     |
 | instance_type        | Instance Type                                                          |    ""     |
 | key_name             | Key Pair Name                                                          |    ""     |
 | volume_size          | Size of volume to allocate on instance                                 |    "8"    |
 | volume_type          | Type of volume to be allocated on instances                            |   "gp2"   |
 | device_name          | Mount point of volume to be allocated on instance                      |"/dev/sda1"|
 | delete_on_termination| Defines whether the volume will be destroyed after instance termination|   false   |
 | resource_type        | Type of features the tag will receive                                  | "instance"|

 **Outputs**
 ------
 |           Name         |                   Value                            |
 | ---------------------- |:--------------------------------------------------:|
 | launch_template_arn    | aws_launch_template.launch_template.arn            |
 | launch_template_version| aws_launch_template.launch_template.latest_version |
 | launch_template_name   | aws_launch_template.launch_template.name           |
 | launch_template_id     | aws_launch_template.launch_template.id             |
 | security_group         | aws_security_group.security_group.id               |

 **External Documentation**
 - [Running an instance from an execution model](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/ec2-launch-templates.html)
 - [Terraform Launch Template](https://www.terraform.io/docs/providers/aws/r/launch_template.html)

 **Created Resources**
 ------
 - IAM Role
 - IAM Instance Profile
 - Security Group
 - Launch Template