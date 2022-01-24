
# AWS SECURTIY GROUP FOR THE BASTION HOST
resource "aws_security_group" "administration" {
  name        = "administration"
  description = "Allow default administration service"
  vpc_id      = aws_vpc.vpc_dev.id
  tags = {
    Name = "administration"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# AWS INSTANCE TO BE USED AS BASTION HOST
resource "aws_instance" "bastion" {
  ami           = var.aws_amis
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_public_key.key_name
  vpc_security_group_ids = [
    aws_security_group.administration.id,
  ]
  subnet_id                   = aws_subnet.subnet01.id
  associate_public_ip_address = true
}
