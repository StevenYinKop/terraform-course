resource "aws_eip" "nat" {
  domain = "vpc"
#  vpc = true
}
resource "aws_nat_gateway" "nat-gw" {
  subnet_id = aws_subnet.main-public-1.id
  allocation_id = aws_eip.nat.id
  depends_on = [
    aws_internet_gateway.main-gw
  ]
}

# VPC setup for NAT
resource "aws_route_table" "main-private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    name = "main-private-1"
  }
}

#route associations private
resource "aws_route_table_association" "main-private-1-a" {
  route_table_id = aws_route_table.main-private.id
  subnet_id = aws_subnet.main-private-1.id
}
resource "aws_route_table_association" "main-private-2-a" {
  route_table_id = aws_route_table.main-private.id
  subnet_id = aws_subnet.main-private-2.id
}
resource "aws_route_table_association" "main-private-3-a" {
  route_table_id = aws_route_table.main-private.id
  subnet_id = aws_subnet.main-private-3.id
}

