provider "aws" {
    region = "eu-west-2"
  
}

resource "aws_instance" "demo_server" {
    ami = "ami-0b594cc165f9cddaa"
    instance_type = "t2.micro"
    key_name = "modclatch"
    security_groups = ["demo-sg"]

  
}

resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "SSH Access"
  

  ingress {
    description      = "SHH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}