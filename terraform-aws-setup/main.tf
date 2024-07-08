provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "MyVPC"
  }
}


resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "MySubnet"
  }
}



resource "aws_instance" "my_ec2" {
  ami             = "ami-06c68f701d8090592"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.my_subnet.id
  
  tags = {
    Name = "MyEC2Instance"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "ediltonjr"

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Studs"
  }
}

