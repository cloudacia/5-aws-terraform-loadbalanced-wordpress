# AWS AUTO SCALING GROUP
resource "aws_autoscaling_group" "as01" {
  vpc_zone_identifier  = [aws_subnet.subnet02.id, aws_subnet.subnet04.id]
  name                 = "as01"
  launch_configuration = aws_launch_configuration.as_conf01.id
  desired_capacity     = 2
  min_size             = 2
  max_size             = 2
  target_group_arns    = [aws_alb_target_group.alb_tg_webserver.arn]
  enabled_metrics      = ["GroupDesiredCapacity"]
  health_check_type    = "ELB"

  depends_on = [
    aws_instance.bastion
  ]
}

# AWS AUTO SCALING POLICY UP
resource "aws_autoscaling_policy" "web_policy_up" {
  name                   = "web_policy_up"
  scaling_adjustment     = 2
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 120
  autoscaling_group_name = aws_autoscaling_group.as01.id
}

# AWS AUTO SCALING POLICY DOWN
resource "aws_autoscaling_policy" "web_policy_down" {
  name                   = "web_policy_down"
  scaling_adjustment     = -2
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 120
  autoscaling_group_name = aws_autoscaling_group.as01.id
}
