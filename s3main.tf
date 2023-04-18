provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-bucket"
  #bridgecrew:skip=999326330578625536_AWS_1680051330670:I need this public
  #bridgecrew:skip=BC_AWS_GENERAL_56:I would like to bypass KMS for this test instance
  tags = {
    Environment = "test"
  }
}
