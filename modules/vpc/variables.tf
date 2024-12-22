variable "region" {
    type = string
    default = "ap-south-1"
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "sub1_name" {
  type = string
}

variable "sub1_cidr" {
  type = string
  default = "10.0.0.0/24"
}

variable "sub2_name" {
  type = string
}

variable "sub2_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "az1" {
  type = string
  default = "ap-south-1a"
}

variable "az2" {
  type = string
  default = "ap-south-1b"
}

variable "sg_name" {
  type = string
  default = "Web-sg"
}

