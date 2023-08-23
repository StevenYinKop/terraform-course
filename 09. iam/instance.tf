resource "aws_instance" "example" {
  ami           = var.AMIs[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.example-instance.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  # role:
  iam_instance_profile = aws_iam_instance_profile.s3_bucket_role_instance_profile.name

  user_data = file("./scripts/install-aws-cli.sh")
}

resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}
