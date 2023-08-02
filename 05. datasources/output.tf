output "public-ip" {
  value = aws_instance.example1.public_ip
}

output "private-ip" {
  value = aws_instance.example1.private_ip
}

output "instance-id" {
  value = aws_instance.example1.id
}

output "result" {
  value = "aws_instances have spinned up successfully! public ips: ${aws_instance.example1.public_ip}, ${aws_instance.example2.public_ip}, ${aws_instance.example3.public_ip}, ${aws_instance.example4.public_ip}"
}
