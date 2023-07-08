# Create a VPC
resource "aws_instance" "my_ec2" {
  ami           = "ami-06ca3ca175f37dd66"
  instance_type = "t2.micro"
}