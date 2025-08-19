terraform {
  backend "s3" {
    bucket         = "terraform-state-s3-sergei"  # существующий bucket
    key            = "project-2/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"           # таблица для блокировки
    encrypt        = true
  }
}
