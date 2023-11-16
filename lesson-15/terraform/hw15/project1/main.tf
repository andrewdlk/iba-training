provider "aws" {
  region = "us-east-1"
}

module "aws-vpc-git" {
  source = "git@github.com:terraform-aws-modules/terraform-aws-vpc.git"

  name = "dav-vpc-by-git-module"
  cidr = "10.100.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e"]
  private_subnets = ["10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24", "10.100.4.0/24", "10.100.5.0/24"]
  public_subnets  = ["10.100.101.0/24", "10.100.102.0/24", "10.100.103.0/24", "10.100.104.0/24", "10.100.105.0/24"]

  enable_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "DAV-DEV"
  }
}



/*module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"
}*/
