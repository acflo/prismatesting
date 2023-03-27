provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-bucket"
  acl    = "private"
  tags = {
    Environment = "test"
  }
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.my-bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
