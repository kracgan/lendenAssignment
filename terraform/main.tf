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
    cidr_blocks = ["0.0.0.0/16"]   # ❌ intentional vulnerability -> now Corrected ✔️
  }

  ingress {
    description = "Node app port"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "node_app" {
  ami                    = "ami-0f5ee92e2d63afc18"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.secure_sg.id]

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted = true
  }

  tags = {
    Name = "NodeApp-DevSecOps"
  }
}
