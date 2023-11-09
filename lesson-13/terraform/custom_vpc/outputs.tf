output "av-ec2-vpc-by-tf" {
  value = aws_instance.dav_ec2_by_tf.id
}

output "av-ec2-vpc-by-tf-PublicIP" {
  value = aws_instance.dav_ec2_by_tf.public_ip
}

output "av-ec2-vpc-by-tf-VPC-Id" {
  value = aws_vpc.staging-vpc.id
}
