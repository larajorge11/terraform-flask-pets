variable "vpc_id" {}

variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "subnet_public_cidr" {
  default = ["172.16.0.0/24", "172.16.1.0/24"]
  type = list
}

variable "subnet_public_availability_zone" {
  default = ["us-east-2a", "us-east-2b"]
  type = list
}