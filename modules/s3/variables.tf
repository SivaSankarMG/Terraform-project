variable "region" {
  type = string
  default = "ap-south-1"
}

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
