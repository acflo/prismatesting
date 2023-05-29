provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0da25504d467cb134"  
  instance_type = "t2.small"               
  key_name      = "aflorestest"      
  subnet_id     = "subnet-013f88f40e623624b" 
  iam_instance_profile   = "IAM-EC2-Admin" 
  
  tags = {
    Name = "aflores-test-machine"
  }
  
  user_data = <<-EOF
    #!/bin/bash
    sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
    sudo systemctl enable amazon-ssm-agent
    sudo systemctl start amazon-ssm-agent
  EOF
  
}
