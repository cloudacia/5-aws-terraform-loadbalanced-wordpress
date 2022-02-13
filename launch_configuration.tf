locals {
  credentials = {
    httpd_root_dir  = var.httpd_root_dir
    file_system_dns = aws_efs_file_system.wordpress-efs.dns_name
  }
}

# AWS LAUNCH CONFIGURATION
resource "aws_launch_configuration" "as_conf01" {
  name_prefix          = "web_config"
  image_id             = var.aws_amis
  instance_type        = var.instance_type
  key_name             = aws_key_pair.ec2_public_key.id
  security_groups      = [aws_security_group.webserver.id, aws_security_group.administration.id]
  iam_instance_profile = aws_iam_instance_profile.instance_profile01.id
  user_data            = base64encode(templatefile("bootstraping/script.sh", local.credentials))

  depends_on = [
    aws_instance.bastion
  ]
}
