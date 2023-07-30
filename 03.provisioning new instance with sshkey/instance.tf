# This Terraform code is defining three resources - an AWS key pair, an AWS EC2 instance and an AWS security group
# The aws_key_pair resource is creating a new key pair called "mykey" in AWS, using the public key loaded from the var.PATH_TO_PUBLIC_KEY variable.
resource "aws_key_pair" "mykey" {
  public_key = file(var.PATH_TO_PUBLIC_KEY)
  key_name = "mykey"
}

resource "aws_instance" "example" {
  # The aws_instance resource is launching an EC2 instance using the AMI (Amazon Machine Image) specified in the var.AMIS map variable, with an instance type of t2.micro.
  ami = var.AMIs[var.AWS_REGION]
  instance_type = "t2.micro"
  # It's attaching the "mykey" key pair to the instance by referencing the key_name attribute of the aws_key_pair resource.
  key_name = aws_key_pair.mykey.key_name
  vpc_security_group_ids = [aws_security_group.my_sg.id]


  # It has two provisioners defined -
  # a "file" provisioner that copies the script.sh file to /tmp/script.sh on the instance.
  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }

  # a "remote-exec" provisioner that makes the script executable, removes carriage returns, and executes it.
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }
  # The connection block specifies how to SSH into the instance to run the provisioners,
  # using the private key from var.PATH_TO_PRIVATE_KEY and the public IP or private IP of the instance.
  connection {
    host = coalesce(self.public_ip, self.private_ip)
    type = "ssh"
    user = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}

# This defines a security group called "my_sg" with some basic ingress/egress rules
# and then passes the security group ID to the aws_instance via the vpc_security_group_ids argument.
#You can define multiple security groups and pass a list to vpc_security_group_ids to attach multiple groups to the instance.
#The key steps are:
#1. Define security group(s) as resources
#2. Reference their ID(s) in vpc_security_group_ids on the aws_instance
#This will attach the security group(s) to the instance at launch time.
resource "aws_security_group" "my_sg" {
  name        = "my_security_group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
