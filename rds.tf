resource "aws_db_subnet_group" "wordpress_db" {
  subnet_ids = [aws_subnet.subnet05.id, aws_subnet.subnet06.id]
}

resource "aws_db_instance" "wordpress_db" {
  allocated_storage      = 10
  engine                 = var.rds_engine
  engine_version         = var.rds_engine_version
  instance_class         = var.rds_instance_class
  name                   = var.rds_db_name
  username               = var.rds_db_username
  password               = var.rds_db_password
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.wordpress_db.id
  vpc_security_group_ids = [aws_security_group.mysql_sg.id]
}
