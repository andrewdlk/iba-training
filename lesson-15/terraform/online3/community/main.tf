provider "aws" {
  region = "us-east-1"
}

module "rds" {
  source            = "terraform-aws-modules/rds/aws"
  version           = "6.3.0"
  identifier        = "davdb"
  engine            = "postgres"
  engine_version    = "15.3"
  instance_class    = "db.t3.micro"
  allocated_storage = 8
  db_name           = "demodb"
  username          = "user"
  port              = "3306"
  tags = {
    Owner       = "Andrew DL"
    Environment = "DEV"
  }
  skip_final_snapshot = true
}

