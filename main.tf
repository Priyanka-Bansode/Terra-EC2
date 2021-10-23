provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAWWUNA3GFFGQ37X45"
  secret_key = "mOOVlbUozjFZWWg4NvAIk2vI+cusYl3VyiTegijX"
}
resource "aws_instance" "example" {
  ami           = "ami-074cce78125f09d61"
 count = 1
 key_name = "newpemkey"
  instance_type = "t2.micro"
 security_groups = ["security_instance_jenkins"]
 tags= {
 Name = "EC2_instance_using_terraform"
}
}

resource "aws_security_group" "security_instance_jenkins" {
 name = "security_instance_jenkins"
 description = "security group for jenkins"

ingress {
 from_port = 8080
 to_port = 8080
 protocol = "tcp"
 cidr_blocks = ["0.0.0.0/0"]
}

ingress {
 from_port = 22
 to_port = 22
 protocol = "tcp"
 cidr_blocks = ["0.0.0.0/0"]
}
egress {
 from_port = 0
 to_port = 65535
 protocol = "tcp"
 cidr_blocks = ["0.0.0.0/0"]
}
tags = {
        Name = "security_instance"
}
}
