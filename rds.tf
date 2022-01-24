resource "aws_db_subnet_group" "wordpress_db" {
  subnet_ids = [aws_subnet.subnet05.id, aws_subnet.subnet06.id]
}

resource "aws_db_instance" "wordpress_db" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  name                   = "wordpress"
  username               = "admin"
  password               = "password1234"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.wordpress_db.id
  vpc_security_group_ids = [aws_security_group.mysql_sg.id]
}
