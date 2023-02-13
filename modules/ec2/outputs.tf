#modules/network-layer/variables.tf
# VPC
output "webapp-server" {
  value = "${aws_instance.webapp-server.id}"
}

# Subnet
output "webapp-server_public_ip" {
  value = "${aws_instance.webapp-server.public_ip}"
}