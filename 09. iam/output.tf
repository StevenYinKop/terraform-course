output "ec2-instance-public-ip" {
  value = aws_instance.example.public_ip
}
