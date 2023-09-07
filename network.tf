resource "aws_vpc" "lab-vpc01" {
 cidr_block = "10.0.0.0/18"
 
 tags = {
   Name = "lab-vpc01"
 }
}