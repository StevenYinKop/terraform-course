resource "aws_instance" "example" {
  ami = var.AMIs[var.AWS_REGION]
  instance_type = "t2.micro"
}
