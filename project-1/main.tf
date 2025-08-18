# --- IAM Role for EC2 to access S3 ---
module "iam_ec2_s3" {
  source = "./modules/iam_ec2_s3"

  env       = var.env
  bucket_arn = module.s3.s3_bucket_arn
}

# --- Attach IAM role to EC2 ---
resource "aws_instance" "this_with_iam" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_id

  iam_instance_profile = module.iam_ec2_s3.instance_profile_name

  tags = { Name = "${var.env}-ec2" }
}
