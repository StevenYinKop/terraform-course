output "aws_vpc_main" {
  value = aws_vpc.main
}

output "aws_vpc_subnet" {
  value = [aws_subnet.main-public-1, aws_subnet.main-public-2, aws_subnet.main-public-3]
}
