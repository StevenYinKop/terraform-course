resource "aws_instance" "example1" {
  ami           = var.AMIs[var.AWS_REGION]
  instance_type = "t2.micro"
}
resource "aws_instance" "example2" {
  ami           = var.AMIs[var.AWS_REGION]
  instance_type = "t2.micro"
}
resource "aws_instance" "example3" {
  ami           = var.AMIs[var.AWS_REGION]
  instance_type = "t2.micro"
}
resource "aws_instance" "example4" {
  ami           = var.AMIs[var.AWS_REGION]
  instance_type = "t2.micro"
}


data "aws_ip_ranges" "ec2_instances" {
  regions    = ["ap-southeast-2"]
  services   = ["ec2"]
  depends_on = [aws_instance.example1, aws_instance.example2, aws_instance.example3, aws_instance.example4]
}

resource "aws_security_group" "all_ap-southeast-2_ec2" {
  name = "all_ap-southeast-2_ec2"
  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = data.aws_ip_ranges.ec2_instances.cidr_blocks
  }
  tags = {
    CreateDate = data.aws_ip_ranges.ec2_instances.create_date
    SyncToken  = data.aws_ip_ranges.ec2_instances.sync_token
  }

}
