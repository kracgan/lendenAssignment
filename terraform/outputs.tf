output "public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_eip.node_app_eip.public_ip
}
