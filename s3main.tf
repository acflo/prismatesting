provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-bucket"
  acl    = "private"
  #checkov:skip=CKV_AWS_18:The bucket does not need logging
  #bridgecrew:skip=999326330578625536_AWS_1679460210128:i want this outside SYDNEY
  tags = {
    Environment = "test"
  }
}
