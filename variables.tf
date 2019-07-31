variable "name" {}

variable "key_name" {}

variable "ami_id" {
  default = "ami-0c3fd0f5d33134a76"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_id" {}

variable "vpc_id" {}

variable "trusted_cidr_blocks" {
  type = "list"
}
