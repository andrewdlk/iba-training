# ======================================================================
# HW14  -  2 VPC in Workspaces
# Learning Terraform
# Made by Andrew DL
# ======================================================================


provider "aws" {
  region = "us-east-1"
}

# Create Custom VPC

resource "aws_vpc" "staging-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dav-vpc"
  }
}

# Create IGW

resource "aws_internet_gateway" "staging-igw" {
  vpc_id = aws_vpc.staging-vpc.id
  tags = {
    Name = "dav-igw"
  }
}

# Create Custom Route Table

resource "aws_route_table" "staging-rt" {
  vpc_id = aws_vpc.staging-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.staging-igw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.staging-igw.id
  }

  tags = {
    Name = "dav-public-rt"
  }
}

# Create Staging Public Subnet

resource "aws_subnet" "staging-subnet-1" {
  vpc_id            = aws_vpc.staging-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "dav-staging-subnet"
  }
}

# Create assiciation between Subnet and Custom Route Table

resource "aws_route_table_association" "subnet-rt-as" {
  subnet_id      = aws_subnet.staging-subnet-1.id
  route_table_id = aws_route_table.staging-rt.id
}

# Create EC2 Instance in Custom VPC

resource "aws_instance" "dav_ec2_by_tf" {
  ami                         = "ami-0fc5d935ebf8bc3bc" # Ubuntu Linux 22.04 x64
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.dav-sg-tf.id]
  user_data                   = file("user_data.sh")
  subnet_id                   = aws_subnet.staging-subnet-1.id
  availability_zone           = "us-east-1a"

  tags = {
    Name  = "dav-ec2-vpc-by-tf"
    Owner = "Andrew DL"
  }

}

# Create Security group

resource "aws_security_group" "dav-sg-tf" {
  name        = "dav-sg-tf"
  description = "Allow WEB and ADM inbound traffic"
  vpc_id      = aws_vpc.staging-vpc.id

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


