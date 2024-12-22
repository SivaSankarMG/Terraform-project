variable "region" {
  type = string
  default = "ap-south-1"
}

# S3 --------------------------------------------------

variable "bucket_name" {
  type = string
}

variable "dest_path" {
  type = string
}

variable "src_path" {
  type = string
  default = "./modules/s3/architecture.jpeg"
}


# IAM -----------------------------------------------------

variable "ec2_s3_role_name" {
  type = string  
}

variable "ec2_s3_policy_name" {
  type = string
}

variable "account_id" {
  type = string
}


# VPC ---------------------------------------------------

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



# EC2 ---------------------------------------------------

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}