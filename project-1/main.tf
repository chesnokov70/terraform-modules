module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr       = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24","10.0.2.0/24"]
  private_subnets= ["10.0.101.0/24","10.0.102.0/24"]
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "terraform-state-s3-sergei-data"
}

module "iam" {
  source = "./modules/iam"
}

module "ec2" {
  source                  = "./modules/ec2"
  instance_type           = "t3.small"
  subnet_id               = module.vpc.public_subnet_ids[0]
  iam_instance_profile_name = module.iam.instance_profile_name
}
