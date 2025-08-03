resource "aws_launch_template" "template" {
  name_prefix            = "private_web"
  image_id               = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = var.key_name
  user_data              = base64encode(file(var.user_data_scripts[0]))
}

resource "aws_autoscaling_group" "asg" {

  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }

  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  vpc_zone_identifier = aws_subnet.private_subnets[*].id
  target_group_arns   = [aws_lb_target_group.tg.arn]
  health_check_type   = "EC2"

  tag {
    key                 = "Name"
    value               = "web-asg-instance"
    propagate_at_launch = true
  }
}