module "dynamodb-table" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "4.0.0"
  name    = "dav-terraform-module"
  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]
}
