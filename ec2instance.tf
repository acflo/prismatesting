provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0fc20dd1da406780b"  
  instance_type = "t2.small"               
  key_name      = "aflorestest"      
  subnet_id     = "subnet-013f88f40e623624b" 
  
  tags = {
    Name = "aflores-test-machine"
  }
}
