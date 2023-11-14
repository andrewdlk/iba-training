# ======================================================================
# HW14  -  Task 2: Create RDS and attache password using resource random password and save it in parameter store 
# Learning Terraform
# Made by Andrew DL
# ======================================================================

variable "region" {
  default = "us-east-1"
}

variable "dav-common-tags" {
  description = "Common Tags"
  type        = map(any)
  default = {
    Owner       = "Andrew DL"
    Project     = "RDS-ParameterStore"
    Environment = "Development"
  }
}
