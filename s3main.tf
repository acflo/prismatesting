provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-bucket"
  acl    = "private"
  #checkov:skip=CKV_AWS_18:The bucket does not need logging
  tags = {
    Environment = "test"
  }
}
