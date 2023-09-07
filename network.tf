provider "aws" {
  region = "us-east-1" # Set your desired AWS region here
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16" # Replace with your VPC's CIDR block
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.1.0/24" # Replace with your private subnet's CIDR block
  availability_zone       = "us-east-1a" # Replace with your desired availability zone
}

resource "aws_vpc_endpoint" "example" {
  vpc_id              = aws_vpc.example.id
  service_name        = "com.amazonaws.us-east-1.ssm" # Point to AWS Systems Manager (SSM) service
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [] # Add security groups if necessary
  subnet_ids          = [aws_subnet.private.id] # Associate with the private subnet
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0" # Default route for private subnet (Internet Gateway, NAT Gateway, etc.)
    gateway_id = aws_vpc.example.id # Replace with the appropriate gateway ID if necessary
  }
}

resource "aws_route" "ssm_endpoint" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0" # Route all traffic to the SSM endpoint
  vpc_endpoint_id        = aws_vpc_endpoint.example.id
}

output "vpc_endpoint_dns" {
  value = aws_vpc_endpoint.example.dns_entry.0.dns_name
}

