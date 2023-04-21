provider "aws" {
  region = "ap-southeast-2"
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my_bucket"
  tags = {
    Environment = "test"
  }
}
