terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
    profile = "thiagoenv"
    region = "sa-east-1"
}

resource "aws_instance" "cursos-dev" {
    count = 3
    ami = "ami-08ae71fd7f1449df1"
    instance_type = "t2.micro"
    key_name = "tmonteiro-aws"
    tags = {
        Name = "cursos-dev${count.index}"
    }
    vpc_security_group_ids = ["sg-03a9693a69e5a06ba"]
}

resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "Allow ssh access"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["177.127.69.87/32"]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  tags = {
    Name = "ssh"
  }
}