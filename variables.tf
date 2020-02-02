variable "name" {
  default = ""
  description = "Launch Template name."
}

variable "tags" {
  type    = "map"
  default = {}
  description = "Setting tags for the feature" 
}

variable "vpc_id" {
  default = ""
  description = "VPC ID"
}

variable "private_subnet" {
  default = ""
  description = "Subnet ID "
}

variable "security_groups_id" {
  default = []
  description = "A list of security group IDs to associate."
}

variable "tenancy" {
  default = "default"
  description = "The tenancy of the instance (if the instance is running in a VPC). Can be default, dedicated, or host."
}

variable "monitoring" {
  default = "false"
  description = "The monitoring option for the instance."
}

variable "public_ip_association" {
  default = "false"
  description = "Associate a public ip address with the network interface."
}


variable "service_type" {
  default = ""
  description = "Type of service."
}

variable "ami" {
  default = ""
  description = "ID AMI image."
}

variable "key_name" {
  default = ""
  description = "Key pair name."
}

variable "instance_type" {
  default = ""
  description = "Type of EC2 instance."
}

variable "azs" {
  default = ""
  description = "Availability zones."
}

variable "volume_size" {
  default = "8"
  description = "The size of the volume in gigabytes"
}

variable "volume_type" {
  default = "gp2"
  description = "The type of volume (standard, gp2, or io1)."
}

variable "delete_on_termination" {
  default = "false"
  description = "Whether the volume should be destroyed on instance termination."
}

variable "device_name" {
  default = "/dev/sda1"
  description = "The name of the device to mount."
}

variable "resource_type" {
  default =  "instance"
  description = "The type of resource to tag (instance or volume)."
}