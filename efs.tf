###############################################
#  ELASTIC FILESYSTEM                         #
###############################################
resource "aws_efs_file_system" "wordpress-efs" {
  creation_token = "wordpress-efs"
}

###############################################
#  EFS MOUNT TARGET #1                        #
###############################################
resource "aws_efs_mount_target" "wordpress-efs-1" {
  file_system_id  = aws_efs_file_system.wordpress-efs.id
  subnet_id       = aws_subnet.subnet05.id
  security_groups = [aws_security_group.efs.id]
}

###############################################
#  EFS MOUNT TARGET #2                        #
###############################################
resource "aws_efs_mount_target" "wordpress-efs-2" {
  file_system_id  = aws_efs_file_system.wordpress-efs.id
  subnet_id       = aws_subnet.subnet06.id
  security_groups = [aws_security_group.efs.id]
}
