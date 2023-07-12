resource "aws_instance" "public" {
  ami                         = "ami-06ca3ca175f37dd66"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = "demo"
  vpc_security_group_ids      = []
  subnet_id                   = [aws_subnet.public[0].id]

  tags = {
    Name = "${var.env_code}-public"
  }
}

resource "aws_security_group" "public" {
  name        = "${var.env_code}-public"
  description = "Allow inbound traffic"
  vpc         = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["76.185.129.201/32"]
  }

  egress {
    description = "SSH"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "${var.env_code}-public"
  }
}