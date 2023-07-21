provider "aws" {
  
}

resource "aws_instance" "example1" {
    ami = "ami-06c13ede344452248"
    instance_type = "t2.micro"
}