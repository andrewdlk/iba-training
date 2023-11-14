variable "region" {
  default = "us-east-1"
}

variable "dav-common-tags" {
  description = "Common Tags"
  type        = map(any)
  default = {
    Owner       = "Andrew DL"
    Project     = "Modules"
    Environment = "Development"
  }
}
