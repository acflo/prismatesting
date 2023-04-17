provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "acflomy-bucket" {
  bucket = "acflomy-bucket"
  tags = {
    Environment = "test"
  }
}
