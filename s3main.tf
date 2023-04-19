provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my_bucket"
  #bridgecrew:skip=999326330578625536_AWS_1680051330670:I need this public
  #bridgecrew:skip=BC_AWS_GENERAL_56:I would like to bypass KMS for this test instance
  tags = {
    tyroTeam = "SECE"
    tyroDataClassification = "Public"
    tyroRiskClassification = "High"
  }
}

resource "aws_s3_bucket_ownership_controls" "bucket_ownership_controls" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
