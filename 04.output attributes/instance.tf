resource "aws_instance" "example" {
  ami = var.AMIs[var.AWS_REGION]
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.private_ip} >> private_up.log"
  }
}
