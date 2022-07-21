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
    ami = var.amis["sa-east-1"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev1"
    }
    vpc_security_group_ids = ["sg-4774aa0f"]
}
resource "aws_instance" "dev2" {
    ami = var.amis["sa-east-1"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev2"
    }
    vpc_security_group_ids = ["sg-4774aa0f"]
}
resource "aws_instance" "dev3" {
    ami = var.amis["sa-east-1"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev3"
    }
    vpc_security_group_ids = ["sg-4774aa0f"]
}

# resource "aws_instance" "dev4" {
#     ami = var.amis["sa-east-1"]
#     instance_type = "t2.micro"
#     key_name = var.key_name
#     tags = {
#         Name = "dev4"
#     }
#     vpc_security_group_ids = ["sg-4774aa0f"]
#     depends_on = [aws_s3_bucket.dev4]
# }

resource "aws_instance" "dev5" {
    ami = var.amis["sa-east-1"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev5"
    }
    vpc_security_group_ids = ["sg-4774aa0f"]
}

resource "aws_instance" "dev6" {
  provider = aws.us-east-1
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev6"
    }
    vpc_security_group_ids = ["sg-08c72dc065a1bf32e"]
    depends_on = [aws_dynamodb_table.dynamo-db-thiago]
}

# resource "aws_s3_bucket" "dev4" {
#   bucket = "cursoterraform-dev4"

#   tags = {
#     Name = "cursoterraform-dev4"
#   }
# }

# resource "aws_s3_bucket_acl" "dev4-acl" {
#   bucket = aws_s3_bucket.dev4.id
#   acl    = "private"
# }

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