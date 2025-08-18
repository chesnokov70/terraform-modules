output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_id" {
  value = module.ec2.instance_id
}

output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}
