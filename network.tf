# Create our lab VPC
resource "aws_vpc" "lab-vpc01" {
 cidr_block = "10.0.0.0/18"
 
 tags = {
   Name = "lab-vpc01"
 }
}

# Create private subnet
resource "aws_subnet1" "private_subnet1" {
  vpc_id     = aws_vpc.main.id 
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private_subnet"
  }
}

# Create VPC endpoint for Session Manager 
resource "aws_vpc_endpoint" "ssm" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.us-east-1.ssm"
  
  tags = {
    Name = "ssm-endpoint"
  }
}