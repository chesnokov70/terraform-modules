module "s3_bucket" {
  source  = "terraform-state-s3-sergei/s3-bucket/aws"
  version = "~> 4.0"

  bucket = var.bucket_name
  acl    = "private"

  versioning = {
    enabled = true
  }

  tags = {
    Environment = var.env
    Project     = "demo"
  }
}
