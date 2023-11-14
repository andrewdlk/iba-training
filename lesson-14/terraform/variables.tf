# ======================================================================
# HW14  -  2 VPC in Workspaces
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
    Project     = "Workspaces"
    Environment = "Development"
  }
}


variable "dav-vpc1-cidr_block" {
  type    = string
  default = "10.200.0.0/16"
}
