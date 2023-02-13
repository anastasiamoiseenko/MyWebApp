#modules/network-layer/variables.tf
# VPC
output "webapp-server" {
  value = "${module.ec2.webapp-server}"
}

# Subnet
output "webapp-server_public_ip" {
  value = "${module.ec2.webapp-server_public_ip}"
}

#modules/network-layer/variables.tf
# VPC
output "vpc_id_test" {
  value = "${module.network.vpc_id_test}"
}

# Subnet
output "subnet_id_test" {
  value = "${module.network.subnet_id_test}"
}