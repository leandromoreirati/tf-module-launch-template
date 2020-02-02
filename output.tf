/* LAUNCH TEMPLATE */
output "launch_template_arn" {
  value = aws_launch_template.launch_template.arn
}

output "launch_template_version" {
  value = aws_launch_template.launch_template.latest_version
}

output "launch_template_name" {
  value = aws_launch_template.launch_template.name
}

output "launch_template_id" {
  value = aws_launch_template.launch_template.id
}

