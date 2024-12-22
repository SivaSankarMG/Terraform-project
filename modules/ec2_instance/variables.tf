variable "region" {
  type = string
  default = "ap-south-1"
}

variable "ami" {
  type = string
}


variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "iam_instance_profile_name" {
  type = string
}

variable "sg_id" {
  type = string
}

variable "sub1_id" {
  type = string
}

variable "sub2_id" {
  type = string  
}