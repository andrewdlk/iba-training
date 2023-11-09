output "dav-ubuntu-serverID" {
  value = aws_instance.dav_ubuntu_by_tf.id
}

output "dav-ubuntu-server-PublicIP" {
  value = aws_instance.dav_ubuntu_by_tf.public_ip
}
