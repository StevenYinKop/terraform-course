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

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = aws_instance.example-in-main-vpc.availability_zone
  size = 20
  type = "gp2"
  tags = {
    name = "extra volume - 20GB"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  instance_id = aws_instance.example-in-main-vpc.id
  volume_id   = aws_ebs_volume.ebs-volume-1.id
}
