terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# Creating key-pair ssh key on AWS
resource "aws_key_pair" "keyname" {
  key_name   = var.key-name
  public_key = file("${pathToFile}/keyname.pub")
}
# Creating security group
resource "aws_security_group" "security-group" {
  name        = var.security-group-name
  description = "security gorup descriton"

  # Inbound rules
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tag"
  }
}
provider "aws" {
  # use awscli to configure keys instead of hard coded or exported env
  region = "eu-north-1"
  access_key = "your-access-key"
  secret_key = "your-secret-key"
}
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.type
  key_name               = aws_key_pair.terra.key_name
  # or add and existing key
  # key_name      = "value"
  vpc_security_group_ids = [aws_security_group.security-group.id]

  tags = {
    Name = "instance name"
  }
}
