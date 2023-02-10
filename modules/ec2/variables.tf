variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "test"
}

variable "ami_id" {
  type = map
  default = {
    eu-west-1    = "ami-0b752bf1df193a6c4"
  }
}

variable "vpc_id" {
  type = any
}

variable "subnet_public_1_id" {
  type = any
}

variable "subnet_public_2_id" {
  type = any
}

variable "elb_sg_id" {
  type = any
}

variable "region" {
  type = any
}