provider "aws" {
  region = var.region
}

resource "aws_security_group" "secure_sg" {
  name        = "secure-sg"
  description = "Hardened security group after DevSecOps remediation"

  ingress {
    description = "Restricted SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    description = "Node app port"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
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
