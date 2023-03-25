provider "aws" {
  region = "eu-west-1"
}
resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-bucket"
  acl    = "private"
  tags = {
    Environment = "test"
  }
}
