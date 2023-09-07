resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16" # Replace with your VPC's CIDR block
}

resource "aws_vpc_endpoint" "example" {
  vpc_id              = aws_vpc.example.id
  service_name        = "com.amazonaws.us-east-1.ssm" # Point to AWS Systems Manager (SSM) service
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [] # Add security groups if necessary
  subnet_ids          = [aws_subnet.example.id] # Associate with a subnet
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0" # This is the default route (Internet Gateway, NAT Gateway, etc.)
    gateway_id = aws_vpc.example.id # Replace with the appropriate gateway ID if necessary
  }
}

resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.example.id # Replace with your subnet ID
  route_table_id = aws_route_table.example.id
}

resource "aws_subnet" "example" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.0.0/24" # Replace with your subnet's CIDR block
  availability_zone       = "us-east-1a" # Replace with your desired availability zone
  map_public_ip_on_launch = true
}

