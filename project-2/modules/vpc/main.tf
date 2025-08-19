resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags       = { Name = "${var.env}-vpc" }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags              = { Name = "${var.env}-public-subnet" }
}
