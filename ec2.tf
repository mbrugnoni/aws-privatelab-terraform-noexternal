# Add EC2 instance using Amazon Linux 2023 AMI - assumes you have the SSM Role created via QuickSetup
resource "aws_instance" "lab_vm1" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = "t2.micro"
  iam_instance_profile = "AmazonSSMRoleForInstancesQuickSetup"
  subnet_id = aws_subnet.private_subnet1.id
  
  tags = {
    Name = "Lab_VM1" 
  }
}