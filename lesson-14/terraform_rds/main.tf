# ======================================================================
# HW14  -  Task 2:  Create RDS and attache password using resource random password and save it in parameter store 
# Learning Terraform
# Made by Andrew DL
# ======================================================================


provider "aws" {
  region = var.region
}

/*resource "random_string" "rds_password" {
    length = 16
    special = true
    override_special = "/@#$"
}
*/

resource "random_password" "dav_rds_password" {
  length           = 12
  special          = true
  override_special = "!#()%"
}

resource "aws_ssm_parameter" "dav_rds_password" {
  name  = "dav-postgres_dev"
  type  = "SecureString"
  value = random_password.dav_rds_password.result
}

resource "aws_db_instance" "dav-rds" {
  db_name             = "davrds"
  instance_class      = "db.m5d.large"
  engine_version      = "15.3"
  allocated_storage   = 60
  engine              = "postgres"
  username            = "postgres"
  skip_final_snapshot = true
  password            = aws_ssm_parameter.dav_rds_password.value
  tags                = merge(var.dav-common-tags, { Name = "DAV-RDS by Terraform" })
}


