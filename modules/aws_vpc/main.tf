resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.example.id
  cidr_block = var.subnet1_cidr_block
  availability_zone = var.availability_zone1
  tags = {
    Name = var.subnet1_name
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.example.id
  cidr_block = var.subnet2_cidr_block
  availability_zone = var.availability_zone2
  tags = {
    Name = var.subnet2_name
  }
}
resource "aws_subnet" "subnet3" {
  vpc_id = aws_vpc.example.id
  cidr_block = var.subnet3_cidr_block
  availability_zone = var.availability_zone3
  tags = {
    Name = var.subnet3_name
  }
}

resource "aws_internet_gateway" "test-igw" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "test-route" {
  vpc_id = aws_vpc.example.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-igw.id
  }
  tags = {
    Name = var.route_table_name
  }
}

resource "aws_main_route_table_association" "main" {
  vpc_id = aws_vpc.example.id
  route_table_id = aws_route_table.test-route.id
}

resource "aws_route_table_association" "subnet1_association" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.test-route.id
}

resource "aws_route_table_association" "subnet2_association" {
  subnet_id = aws_subnet.subnet2.id
  route_table_id = aws_route_table.test-route.id
}

resource "aws_route_table_association" "subnet3_association" {
  subnet_id = aws_subnet.subnet3.id
  route_table_id = aws_route_table.test-route.id
}
