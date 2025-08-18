resource "aws_instance" "this" {
  ami           = "ami-08c40ec9ead489470" # Amazon Linux 2 us-east-1
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "${var.env}-ec2"
  }
}
