output "ec2-instance-ip" {
  value = aws_instance.example-in-main-vpc.public_ip
}
