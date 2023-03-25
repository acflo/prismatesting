terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.19.0"
    }
  }

  required_version = ">= 1.0.5"

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "simple_s3_bucket" {
  source = "../"
  bucket_name               = "xtrasfsdfsdf-twefesfsdfsdfsdfds"
  bucket_delete_protection  = true

  tags = {
    tyro                = "TeamSuper"
  }

  bucket_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "allowReadWrite"
        Effect    = "Allow"
        Principal =  {
          AWS = [
            "arn:aws:iam::944071908078:user/my-test-user"
          ]
        }
        Action    = [ "s3:*" ]
        Resource  = [
          module.simple_s3_bucket.arn,
          "${module.simple_s3_bucket.arn}/*"
        ]
      }
    ]
  })
}
