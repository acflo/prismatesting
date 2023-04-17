provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-bucket"
  acl    = "private"
  #bridgecrew:skip=999326330578625536_AWS_1680051330670:i want this public
  #bridgecrew:skip=BC_AWS_GENERAL_56:I do not need KMS
  tags = {
    Environment = "test"
  }
}
