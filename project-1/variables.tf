variable "aws_region" {
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "env" {
  type    = string
  default = "dev"
}
