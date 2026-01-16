output "public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.node_app.public_ip
}
