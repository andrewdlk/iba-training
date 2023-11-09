# ======================================================================
# HW13  
# Learning Terraform
# Made by Andrew DL
# ======================================================================


provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "dav_ubuntu_by_tf" {
  ami                    = "ami-0fc5d935ebf8bc3bc" # Ubuntu Linux 22.04 x64
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.dav-sg-tf.id]
  user_data              = file("user_data.sh")

  tags = {
    Name  = "dav-webserver-by-tf"
    Owner = "Andrew DL"
  }
  /*  depends_on = [aws_instance.dav_db_by_tf]
*/
}

resource "aws_instance" "dav_db_by_tf" {
  ami                    = "ami-0fc5d935ebf8bc3bc" # Ubuntu Linux 22.04 x64
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.dav-sg-tf.id]

  tags = {
    Name  = "dav-db-by-tf"
    Owner = "Andrew DL"
  }
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


  /*ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "Allow HTTPs"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
*/
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
