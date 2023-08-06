resource "aws_instance" "example-in-main-vpc" {
  ami = lookup(var.AMIs, var.AWS_REGION)
  instance_type = "t2.micro"

  # VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # public ssh key
  key_name = aws_key_pair.keypair.key_name
}
