data "aws_security_groups" "available" {}

output "data_aws_security_groups_tags" {
  value = data.aws_security_groups.available.tags
}

output "data_aws_security_groups_ids" {
  value = data.aws_security_groups.available.ids
}

output "data_aws_security_groups_arns" {
  value = data.aws_security_groups.available.arns
}


