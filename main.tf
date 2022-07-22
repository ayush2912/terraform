

terraform {
  backend "s3" {
    bucket = "tothetestterraform"
    key    = "terraform/tf-state/hub"
    region = "us-west-2"
    dynamodb_table = "puneet4"
  }
}




/*resource "aws_instance" "test15" {
  ami           = "ami-0d70546e43a941d70"
  instance_type = "t2.micro"
  key_name="test2"
  

  tags = {
    Name = "puneetmddon8"
  }
  
}*/


resource "aws_iam_role" "lambda-ec2-full-accesss" {
    
    assume_role_policy    = jsonencode(
        {
            Statement = [
                {
                    Action    = "sts:AssumeRole"
                    Effect    = "Allow"
                    Principal = {
                        Service = "lambda.amazonaws.com"
                    }
                },
            ]
            Version   = "2012-10-17"
        }
    )
    
    description           = "Allows Lambda functions to call AWS services on your behalf."
    force_detach_policies = false
    
    managed_policy_arns   = [
        "arn:aws:iam::aws:policy/AdministratorAccess",
    ]
    max_session_duration  = 3600
    name                  = "lambda-ec2-full-accesss"
    path                  = "/"
    tags                  = {}
    tags_all              = {}
    

    inline_policy {}
}
data "archive_file" "lambda_zip_dir" {
type = "zip"
output_path = "lambda_zip_dir.zip"
source_dir = "code"
}


resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  
  filename      = "lambda_zip_dir.zip"
  function_name = "lambda_function_name2"
  role = aws_iam_role.lambda-ec2-full-accesss.arn
  handler = "index.test"
 

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  source_code_hash =data.archive_file.lambda_zip_dir.output_base64sha256 
  

  runtime = "nodejs12.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}

/*resource "aws_instance" "test15" {
  ami           = "ami-0d70546e43a941d70"
  instance_type = "t2.micro"
  key_name="test2"
  

  tags = {
    Name = "puneetmddon8"
  }
  
}*/


/*resource "aws_iam_role" "lambda-ec2-full-accesss" {
    
    assume_role_policy    = jsonencode(
        {
            Statement = [
                {
                    Action    = "sts:AssumeRole"
                    Effect    = "Allow"
                    Principal = {
                        Service = "lambda.amazonaws.com"
                    }
                },
            ]
            Version   = "2012-10-17"
        }
    )
    
    description           = "Allows Lambda functions to call AWS services on your behalf."
    force_detach_policies = false
    
    managed_policy_arns   = [
        "arn:aws:iam::aws:policy/AdministratorAccess",
    ]
    max_session_duration  = 3600
    name                  = "lambda-ec2-full-accesss"
    path                  = "/"
    tags                  = {}
    tags_all              = {}
    

    inline_policy {}
}
data "archive_file" "lambda_zip_dir" {
type = "zip"
output_path = "lambda_zip_dir.zip"
source_dir = "code"
}


resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  
  filename      = "lambda_zip_dir.zip"
  function_name = "lambda_function_name2"
  role = aws_iam_role.lambda-ec2-full-accesss.arn
  handler = "index.test"
 

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  source_code_hash =data.archive_file.lambda_zip_dir.output_base64sha256 
  

  runtime = "nodejs12.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}*/


