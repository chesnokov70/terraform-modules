terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# --- VPC ---
module "vpc" {
  source = "./modules/vpc"

  cidr_block = var.vpc_cidr
  env        = var.env
}

# --- EC2 ---
module "ec2" {
  source = "./modules/ec2"

  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_id
  env           = var.env
}

# --- S3 ---
module "s3" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
  env         = var.env
}
