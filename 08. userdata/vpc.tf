# Internet VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default" # Every instance that you launch will use the default tenancy
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
#  enable_classiclink = "false"

  tags = {
    name = "main"
  }
}

resource "aws_subnet" "main-public-1" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone = "${var.AWS_REGION}a"

  tags = {
    name = "subnet-main-public-1"
  }
}

resource "aws_subnet" "main-public-2" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone = "${var.AWS_REGION}b"

  tags = {
    name = "subnet-main-public-2"
  }
}

resource "aws_subnet" "main-public-3" {
  cidr_block = "10.0.3.0/24"
  vpc_id     = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone = "${var.AWS_REGION}c"

  tags = {
    name = "subnet-main-public-3"
  }
}

resource "aws_subnet" "main-private-1" {
  cidr_block = "10.0.4.0/24"
  vpc_id     = aws_vpc.main.id
  map_public_ip_on_launch = false
  availability_zone = "${var.AWS_REGION}a"

  tags = {
    name = "subnet-main-private-1"
  }
}

resource "aws_subnet" "main-private-2" {
  cidr_block = "10.0.5.0/24"
  vpc_id     = aws_vpc.main.id
  map_public_ip_on_launch = false
  availability_zone = "${var.AWS_REGION}b"

  tags = {
    name = "subnet-main-private-2"
  }
}

resource "aws_subnet" "main-private-3" {
  cidr_block = "10.0.6.0/24"
  vpc_id     = aws_vpc.main.id
  map_public_ip_on_launch = false
  availability_zone = "${var.AWS_REGION}c"

  tags = {
    name = "subnet-main-private-3"
  }
}

# Internet GW
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    name = "main-gw"
  }
}

# route tables
resource "aws_route_table" "main-public-route-table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }
  tags = {
    name = "main-public-1"
  }
}

resource "aws_route_table_association" "main-public-1-a" {
  route_table_id = aws_route_table.main-public-route-table.id
  subnet_id = aws_subnet.main-public-1.id
}

resource "aws_route_table_association" "main-public-2-a" {
  route_table_id = aws_route_table.main-public-route-table.id
  subnet_id = aws_subnet.main-public-2.id
}

resource "aws_route_table_association" "main-public-3-a" {
  route_table_id = aws_route_table.main-public-route-table.id
  subnet_id = aws_subnet.main-public-3.id
}

