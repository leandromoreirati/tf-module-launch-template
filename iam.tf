# ROLE
resource "aws_iam_role" "instance_profile_role" {
  name        = "role-${var.name}"
  description = "Create IAM role for EC2 instances."
  path        = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF


  tags = var.tags
}

# IAM INSTANCE PROFILE
resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.name}-instance-profile"
  role = aws_iam_role.instance_profile_role.name
}

