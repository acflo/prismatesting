provider "aws" {
  region = "ap-southeast-1"
}
resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-bucket"
  acl    = "private"
  tags = {
    Environment = "test"
  }
}
