output "ec2-instance-ip" {
  value = aws_instance.example.public_ip
}
