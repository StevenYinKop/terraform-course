resource "aws_instance" "example" {
  ami = lookup(var.AMIs, var.AWS_REGION)
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.security-group.id]

  key_name = aws_key_pair.keypair.key_name

  user_data = data.template_cloudinit_config.cloudinit-example.rendered
}

resource "aws_security_group" "security-group" {
  ingress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "keypair" {
  public_key = file("./key/keypair.pub")
  key_name = "mykeypair"
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = aws_instance.example.availability_zone
  size = 20
  type = "gp2"
  tags = {
    name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = var.INSTANCE_DEVICE_NAME
  volume_id = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.example.id
}


