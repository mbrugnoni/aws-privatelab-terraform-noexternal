# Create our lab VPC
resource "aws_vpc" "lab-vpc01" {
 cidr_block = "10.0.0.0/18"
 enable_dns_hostnames = true
 enable_dns_support = true
 
 tags = {
   Name = "lab-vpc01"
 }
}

# Create private subnet
resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.lab-vpc01.id 
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private_subnet"
  }
}

# Create VPC endpoint for Session Manager 
resource "aws_vpc_endpoint" "ssm" {
  vpc_id       = aws_vpc.lab-vpc01.id
  vpc_endpoint_type = "Interface"
  service_name = "com.amazonaws.us-east-1.ssm"
  private_dns_enabled = true
  subnet_ids = [aws_subnet.private_subnet1.id]
  
  tags = {
    Name = "ssm-endpoint"
  }
}

# Create VPC endpoint for Session Manager 
resource "aws_vpc_endpoint" "ec2ep" {
  vpc_id       = aws_vpc.lab-vpc01.id
  vpc_endpoint_type = "Interface"
  service_name = "com.amazonaws.us-east-1.ec2"
  private_dns_enabled = true
  subnet_ids = [aws_subnet.private_subnet1.id]
  
  
  tags = {
    Name = "ec2-endpoint"
  }
}

# Create VPC endpoint for Session Manager 
resource "aws_vpc_endpoint" "e2m" {
  vpc_id       = aws_vpc.lab-vpc01.id
  vpc_endpoint_type = "Interface"
  service_name = "com.amazonaws.us-east-1.ec2messages"
  private_dns_enabled = true  
  subnet_ids = [aws_subnet.private_subnet1.id]

  tags = {
    Name = "ec2msg-endpoint"
  }
}

# Create VPC endpoint for Session Manager 
resource "aws_vpc_endpoint" "ssmmsg" {
  vpc_id       = aws_vpc.lab-vpc01.id
  vpc_endpoint_type = "Interface"
  service_name = "com.amazonaws.us-east-1.ssmmessages"
  private_dns_enabled = true
  subnet_ids = [aws_subnet.private_subnet1.id]
  
  tags = {
    Name = "ssmmsg-endpoint"
  }
}