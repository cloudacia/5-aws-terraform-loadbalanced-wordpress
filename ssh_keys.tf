
# Public Key for accessing EC2 instances
resource "aws_key_pair" "ec2_public_key" {
  key_name   = "ec2_public_key"
  public_key = var.ec2_ssh_key
}
