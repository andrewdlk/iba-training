resource "aws_ebs_volume" "dav-ebs-terraform" {
  availability_zone = "us-east-1a"
  size              = 8
  tags = {
    Name  = "dav-ebs-terraform"
    Owner = "Andrew DL"
  }
}
