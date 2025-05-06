resource "aws_vpc" "this" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.env
  }
}

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 2, 0)
  map_public_ip_on_launch = true
  availability_zone       = var.az_pri
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 2, 1)
  map_public_ip_on_launch = true
  availability_zone       = var.az_sec
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.env}_gateway"
  }
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.env}_route_table"
  }
}

resource "aws_route_table_association" "subnet_route" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.this.id
}

resource "aws_route_table_association" "subnet2_route" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.this.id
}

resource "aws_security_group" "ssh_ecurity_group" {
  name   = "Allow SSH from allowed addresses"
  vpc_id = aws_vpc.this.id
  description = "Allow SSH from allowed addresses"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
    description = "Allow SSH from allowed addresses"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}