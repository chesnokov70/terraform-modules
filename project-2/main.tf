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
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr
  env        = var.env
}

# --- S3 (Terraform Registry) ---
module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.0"
  bucket  = var.bucket_name
  acl     = "private"
  versioning = { enabled = true }
  tags = {
    Environment = var.env
    Project     = "demo"
  }
}

# --- IAM Role for EC2 to access S3 ---
module "iam_ec2_s3" {
  source    = "./modules/iam_ec2_s3"
  env       = var.env
  bucket_arn = module.s3.s3_bucket_arn
}

# --- EC2 instance with IAM Role ---
resource "aws_instance" "this" {
  ami           = "ami-08c40ec9ead489470"  # Amazon Linux 2 us-east-1
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_id
  iam_instance_profile = module.iam_ec2_s3.instance_profile_name
  tags = { Name = "${var.env}-ec2" }
}
