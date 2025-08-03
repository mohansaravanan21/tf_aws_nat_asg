
resource "aws_lb" "alb" {
  name               = "myALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = aws_subnet.public_subnets[*].id

  tags = {
    Name = "ALB_WEB"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "target-group"
  port     = 8000
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id
  health_check {
    port = "traffic-port"
    path = "/"
  }
}

# resource "aws_lb_target_group_attachment" "tga" {
#   count            = length(aws_instance.web)
#   target_id        = aws_instance.web[count.index].id
#   target_group_arn = aws_lb_target_group.tg.arn
#   port             = 8000
# }

resource "aws_lb_listener" "name" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
