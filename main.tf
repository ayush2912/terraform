resource "aws_instance" "test2" {
  ami           = "ami-0d70546e43a941d70"
  instance_type = "t2.micro"
  key_name="test2"
  

  tags = {
    Name = "puneetmddon4"
  }
  
}

terraform {
  backend "s3" {
    bucket = "tothetestterraform"
    key    = "terraform/tf-state/hub"
    region = "us-west-2"
    dynamodb_table = "puneet4"
  }
}


resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  filename      = "main.zip"
  function_name = "lambda_function_name"
  role          = "lambda-ec2-full-accesss"
  handler       = "index.test"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  

  runtime = "nodejs12.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}