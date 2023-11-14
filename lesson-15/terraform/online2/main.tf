provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "dav-tf-state"
    key            = "dav-dev-tfstate"
    region         = "us-east-1"
    dynamodb_table = "davdyndb"
  }
}

module "aws_ebs_volume" {
  source = "./modules/ebs"
}

/*
resource "aws_ebs_volume" "dav-ebs-terraform" {
  availability_zone = "us-east-1a"
  size              = 8
  tags = {
    Name  = "dav-allow-web-access"
    Owner = "Andrew DL"
  }
}
*/
