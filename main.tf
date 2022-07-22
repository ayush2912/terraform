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
    key    = "terraform/tf-state"
    region = "us-west-2"
  }
}
