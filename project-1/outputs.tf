output "vpc_id" { value = module.vpc.vpc_id }
output "public_subnet_ids" { value = module.vpc.public_subnet_ids }
output "private_subnet_ids" { value = module.vpc.private_subnet_ids }
output "s3_bucket_arn" { value = module.s3.bucket_arn }
output "ec2_instance_id" { value = module.ec2.instance_id }
