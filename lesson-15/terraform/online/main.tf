provider "aws" {
  region = var.region
}


terraform {
  backend "s3" {
    bucket = "dav-tf-state"
    key    = "dav-dev-tfstate"
    region = "us-east-1"
  }
}

module "ec2" {
  source = "./modules/ec2"
}


resource "aws_security_group" "dav-sg-tf" {
  name        = "dav-sg-tf"
  description = "Allow WEB and ADM inbound traffic"

  dynamic "ingress" {
    for_each = ["80", "443", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name  = "dav-allow-web-access"
    Owner = "Andrew DL"

  }
}
