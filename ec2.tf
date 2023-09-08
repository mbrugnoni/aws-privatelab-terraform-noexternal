# Add EC2 instance 
resource "aws_instance" "lab_vm1" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = "t2.micro"
  iam_instance_profile = "AmazonSSMRoleForInstancesQuickSetup"
    
  # Launch into private subnet
  subnet_id = aws_subnet.private_subnet1.id
  
  tags = {
    Name = "Lab_VM1" 
  }
}