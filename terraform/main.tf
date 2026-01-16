provider "aws" {
  region = var.region
}

resource "aws_security_group" "insecure_sg" {
  name        = "insecure-sg"
  description = "Security group with intentional vulnerability"

  ingress {
    description = "SSH open to world (INTENTIONAL)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # ❌ intentional vulnerability
  }

  ingress {
    description = "Node app port"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "node_app" {
  ami                    = "ami-0f5ee92e2d63afc18" # Amazon Linux 2 (ap-south-1)
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.insecure_sg.id]

  tags = {
    Name = "NodeApp-DevSecOps"
  }
}
