provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}
resource "aws_lambda_function" "example_lambda" {
  filename         = "example_lambda.zip"
  function_name    = "example_lambda"
  role             = aws_iam_role.lambda_role.arn
  handler          = "index.handler"
  runtime          = "nodejs14.x"
  timeout          = 10
  memory_size      = 128
  publish          = true
  source_code_hash = filebase64sha256("example_lambda.zip")
  environment {
    variables = {
      ENV_VAR = "example"
    }
  }
}
resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "lambda_role_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_role.name
}
