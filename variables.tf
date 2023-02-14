#modules/user-layer/variables.tf
variable "env" {
    default = "webapp"
}
variable "region" {
    default = "eu-central-1"
}
variable "subnet_cidrs" {
    default = ["10.10.1.0/24"]
}
variable "vpc_cidr" {
    default = "10.10.0.0/16"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "volume_size" {
    default = "20"
}