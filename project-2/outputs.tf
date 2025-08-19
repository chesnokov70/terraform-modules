output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_id" {
  value = aws_instance.this.id
}

output "s3_bucket_arn" {
  value = module.s3.s3_bucket_arn
}
