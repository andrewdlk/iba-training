#==============================
#Network terraform file by Andrew DL
#==============================
variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

resource "aws_vpc" "dav-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "DAV-VPC"
  }
}

resource "aws_subnet" "dav-vpc-subnet" {
  vpc_id     = aws_vpc.dav-vpc.id
  cidr_block = "10.1.1.0/24"

  tags = {
    Name = "dav-vpc-subnet"
  }
}

resource "aws_internet_gateway" "dav-vpc" {
  vpc_id = aws_vpc.dav-vpc.id
}

output "vpc_id" {
  value = aws_vpc.dav-vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.dav-vpc.cidr_block
}
