resource "aws_instance" "test2" {
  ami           = "ami-0d70546e43a941d70"
  instance_type = "t2.micro"
  key_name="test2"
  

  tags = {
    Name = "puneetmddon2"
  }
  
}