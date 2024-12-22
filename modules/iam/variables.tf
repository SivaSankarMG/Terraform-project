variable "region" {
  type = string
  default = "ap-south-1"
}

variable "ec2_s3_role_name" {
  type = string  
}

variable "ec2_s3_policy_name" {
  type = string
}

variable "s3_bucket_name" {
  type = string
}

variable "account_id" {
  type = string
}