provider "aws" {
  region = "ap-southeast-2"
}
resource "aws_s3_bucket" "acflomy-bucket" {
  bucket = "acflomy-bucket"
  tags = {
    Environment = "test"
  }
}
