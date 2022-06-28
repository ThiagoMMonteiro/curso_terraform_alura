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
}

