
# AWS APPLICATION LOAD BALANCER
resource "aws_lb" "alb01" {
  name                       = "alb01"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb.id]
  subnets                    = [aws_subnet.subnet01.id, aws_subnet.subnet03.id]
  enable_deletion_protection = false
}

# AWS ALB TARGET GROUP
resource "aws_alb_target_group" "alb_tg_webserver" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_dev.id

  health_check {
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }
}

# AWS ALB LISTENER
resource "aws_alb_listener" "alb_listener_front_end" {
  load_balancer_arn = aws_lb.alb01.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.alb_tg_webserver.arn
  }
}
