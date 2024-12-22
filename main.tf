provider "aws" {
  region = var.region
}

module "s3" {
  source = "./modules/s3"
  region = var.region
  bucket_name = var.bucket_name
  dest_path = var.dest_path
  src_path = var.src_path 
}

module "iam" {
  source = "./modules/iam"
  region = var.region
  ec2_s3_role_name = var.ec2_s3_role_name
  ec2_s3_policy_name = var.ec2_s3_policy_name
  account_id = var.account_id
  s3_bucket_name = module.s3.bucket_name
}

module "vpc" {
  source = "./modules/vpc"
  region = var.region
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  sub1_name = var.sub1_name
  sub1_cidr = var.sub1_cidr
  sub2_name = var.sub2_name
  sub2_cidr = var.sub2_cidr
  az1 = var.az1
  az2 = var.az2
  sg_name = var.sg_name
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  region = var.region
  ami = var.ami
  instance_type = var.instance_type
  iam_instance_profile_name  = module.iam.iam_instance_profile_name
  sg_id = module.vpc.sg_id
  sub1_id = module.vpc.sub1_id
  sub2_id = module.vpc.sub2_id
}

module "alb" {
  source = "./modules/alb"
  region = var.region
  vpc_id = module.vpc.vpc_id
  sg_id = module.vpc.sg_id
  sub1_id = module.vpc.sub1_id
  sub2_id = module.vpc.sub2_id
  server1_id = module.ec2_instance.server1_id
  server2_id = module.ec2_instance.server2_id
}

