provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "allow_ingress" {
  name        = "allow_ingress"
  description = "security group to allow HTTP ingress on port 80"
  vpc_id      = "vpc-0d576dc151d932f64"

  ingress {
    description = "allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # any IP
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-00467ae173d0acc6f"
  instance_type = "t2.micro"

  # attach secuity group to instance
  vpc_security_group_ids = [aws_security_group.allow_ingress.id]

  # install nginx
  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y &&
    sudo apt install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
  EOF
}

output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}
