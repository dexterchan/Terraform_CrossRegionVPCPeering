resource "aws_lb" "fargate" {
  name               = "load-balancer"
  subnets            = var.lb_subnets
  load_balancer_type = "network"
  internal           = true

  tags = {
    Environment = "staging"
  }
}

resource "aws_lb_listener" "http_forward" {
  load_balancer_arn = aws_lb.fargate.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.fargate.arn
  }
}

resource "aws_lb_listener" "https_forward" {
  load_balancer_arn = aws_lb.fargate.arn
  port              = 443
  protocol          = "TCP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.fargate.arn
  }
}

resource "aws_lb_target_group" "fargate" {
  name        = "webapp-lb-tg"
  port        = 80
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    interval            = "30"
    protocol            = "TCP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
  
}