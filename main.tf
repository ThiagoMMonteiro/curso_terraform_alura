terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# Configure the AWS Providers
provider "aws" {
    profile = "thiagoenv"
    region = "sa-east-1"
}

provider "aws" {
    alias = "us-east-1"
    profile = "thiagoenv"
    region = "us-east-1"
}

resource "aws_instance" "dev1" {
    ami = "ami-08ae71fd7f1449df1"
    instance_type = "t2.micro"
    key_name = "tmonteiro-aws"
    tags = {
        Name = "dev1"
    }
    vpc_security_group_ids = ["sg-4774aa0f"]
}
resource "aws_instance" "dev2" {
    ami = "ami-08ae71fd7f1449df1"
    instance_type = "t2.micro"
    key_name = "tmonteiro-aws"
    tags = {
        Name = "dev2"
    }
    vpc_security_group_ids = ["sg-4774aa0f"]
}
resource "aws_instance" "dev3" {
    ami = "ami-08ae71fd7f1449df1"
    instance_type = "t2.micro"
    key_name = "tmonteiro-aws"
    tags = {
        Name = "dev3"
    }
    vpc_security_group_ids = ["sg-4774aa0f"]
}

resource "aws_instance" "dev4" {
    ami = "ami-08ae71fd7f1449df1"
    instance_type = "t2.micro"
    key_name = "tmonteiro-aws"
    tags = {
        Name = "dev4"
    }
    vpc_security_group_ids = ["sg-4774aa0f"]
    depends_on = [aws_s3_bucket.dev4]
}

resource "aws_instance" "dev5" {
    ami = "ami-08ae71fd7f1449df1"
    instance_type = "t2.micro"
    key_name = "tmonteiro-aws"
    tags = {
        Name = "dev5"
    }
    vpc_security_group_ids = ["sg-4774aa0f"]
}

resource "aws_instance" "dev6" {
  provider = aws.us-east-1
    ami = "ami-052efd3df9dad4825"
    instance_type = "t2.micro"
    key_name = "tmonteiro-aws"
    tags = {
        Name = "dev6"
    }
    vpc_security_group_ids = ["sg-0924cf73e48787904"]
    depends_on = [aws_dynamodb_table.dynamo-db-thiago]
}

resource "aws_s3_bucket" "dev4" {
  bucket = "cursoterraform-dev4"

  tags = {
    Name = "cursoterraform-dev4"
  }
}

resource "aws_s3_bucket_acl" "dev4-acl" {
  bucket = aws_s3_bucket.dev4.id
  acl    = "private"
}

resource "aws_dynamodb_table" "dynamo-db-thiago" {
  provider = aws.us-east-1
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}