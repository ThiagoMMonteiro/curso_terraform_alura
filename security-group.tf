resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "Allow ssh access"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["200.225.113.209/32"]
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "ssh-access-us-east-1" {
    provider = aws.us-east-1
  name        = "ssh-access"
  description = "Allow ssh access"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["200.225.113.209/32"]
  }

  tags = {
    Name = "ssh"
  }
}