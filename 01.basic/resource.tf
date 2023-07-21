provider "aws" {
  
}

variable "AWS_REGION" {
  type = string
}

variable "AMIS" {
  type = map(string)
  default = {
    "eu-west-1" = "EURO"
    "us-west-1" = "USA"
    "cn-north-1" = "CHINA"
  }
}

resource "aws_instance" "example" {
   ami = var.AMIS[var.AWS_REGION]
   instance_type = "t2.micro"
}
resource "aws_instance" "example2" {
   ami = var.AMIS[var.AWS_REGION]
   instance_type = "t2.small"
}
resource "aws_instance" "example3" {
   ami = var.AMIS[var.AWS_REGION]
   instance_type = "t2.micro"
}